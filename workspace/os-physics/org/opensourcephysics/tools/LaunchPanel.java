/*
 * Open Source Physics software is free software as described near the bottom of this code file.
 *
 * For additional information and documentation on Open Source Physics please see: 
 * <http://www.opensourcephysics.org/>
 */

package org.opensourcephysics.tools;
import java.io.*;
import java.util.*;
import java.awt.*;

import javax.swing.*;
import javax.swing.event.*;
import javax.swing.tree.*;
import org.opensourcephysics.controls.*;

/**
 * This is a panel that displays a tree with a LaunchNode root.
 *
 * @author Douglas Brown
 * @version 1.0
 */
public class LaunchPanel extends JPanel {
  // static fields
  protected static final String TEXT_TYPE = "text"; // text editor type //$NON-NLS-1$

  // instance fields
  protected JTree tree;
  protected DefaultTreeModel treeModel;
  protected JSplitPane splitPane;
  protected JPanel dataPanel;     // on splitPane right
  protected JTabbedPane htmlTabs; // each tab is html page
  protected JEditorPane descriptionPane;
  protected JScrollPane descriptionScroller;
  protected boolean showAllNodes;
  protected Map visibleNodeMap = new HashMap();
  protected Launcher launcher;

  /**
   * Constructor.
   *
   * @param rootNode the root node
   * @param launcher the Launcher that is creating this panel
   */
  public LaunchPanel(LaunchNode rootNode, Launcher launcher) {
    showAllNodes = launcher instanceof LaunchBuilder;
    this.launcher = launcher;
    createGUI();
    createTree(rootNode);
    setSelectedNode(rootNode);
  }

  /**
   * Sets the selected node.
   *
   * @param node the node to select
   */
  public void setSelectedNode(LaunchNode node) {
    if(node==null || node == getSelectedNode()) {
      return;
    }
    tree.setSelectionPath(new TreePath(node.getPath()));
  }

  /**
   * Sets the selected node.
   *
   * @param node the node to select
   * @param pageNumber the html page to display
   */
  public void setSelectedNode(LaunchNode node, int pageNumber) {
    setSelectedNode(node);
    displayHTML(node, pageNumber);
  }

  /**
   * Gets the selected node.
   *
   * @return the selected node
   */
  public LaunchNode getSelectedNode() {
    TreePath path = tree.getSelectionPath();
    if(path==null) {
      return null;
    }
    return(LaunchNode) path.getLastPathComponent();
  }

  /**
   * Gets the selected html page.
   *
   * @return the selected html tab
   */
  public int getSelectedHTMLPage() {
    return htmlTabs.getSelectedIndex();
  }

  /**
   * Gets the root node.
   *
   * @return the root node
   */
  public LaunchNode getRootNode() {
    return(LaunchNode) treeModel.getRoot();
  }

  // ______________________________ protected methods _____________________________

  /**
   * Returns the node with the same file name as the specified node.
   * May return null.
   *
   * @param node the node to match
   * @return the first node with the same file name
   */
  protected LaunchNode getClone(LaunchNode node) {
    if(node.getFileName()==null) {
      return null;
    }
    Enumeration e = getRootNode().breadthFirstEnumeration();
    while(e.hasMoreElements()) {
      LaunchNode next = (LaunchNode) e.nextElement();
      if(node.getFileName().equals(next.getFileName())) {
        return next;
      }
    }
    return null;
  }

  /**
   * Displays the html tabs (or text description) for the specified node.
   * 
   * @param node the LaunchNode
   */
  protected void displayHTML(LaunchNode node) {
  	if (node == null) return;
    displayHTML(node, node.htmlIndex);
  }

  /**
   * Displays the html tabs for the specified node
   * and selects the specified pageNumber.
   * 
   * @param node the LaunchNode
   * @param pageNumber the page to select
   */
  protected void displayHTML(LaunchNode node, int pageNumber) {
    if(node!=null) {
    	if (node == getSelectedNode()) {
      	int page = getSelectedHTMLPage();
      	if (page >= 0) {
	        Launcher.HTMLTab tab = launcher.getHTMLTab(page);
	        LaunchNode.HTML html = (LaunchNode.HTML)node.htmlData.get(pageNumber);
	        if (tab.editorPane.getPage() == html.url) 
	        	return;
      	}
      	else if (node.htmlData.size() > 0) { 
	        LaunchNode.HTML html = (LaunchNode.HTML)node.htmlData.get(0);
	        Launcher.HTMLTab tab = launcher.getHTMLTab(0);
      		if (tab != null && tab.editorPane.getPage() == html.url) 
      			return;
      	}
    	}
      OSPLog.finer(LaunchRes.getString("Log.Message.NodeSelected")+" "+node); //$NON-NLS-1$ //$NON-NLS-2$
    	// rebuild htmlTabs
      String noTitle = LaunchRes.getString("HTMLTab.Title.Untitled"); //$NON-NLS-1$
    	boolean isBuilder = launcher instanceof LaunchBuilder;
    	int tabCount = 0;
    	if (!isBuilder) htmlTabs.removeAll();
    	Iterator it = node.htmlData.iterator();
    	while (it.hasNext()) {
    	  final LaunchNode.HTML html = (LaunchNode.HTML)it.next();
    	  if (html.url != null) {
            try {
              if(html.url.getContent()!=null) {
                final Launcher.HTMLTab tab = launcher.getHTMLTab(tabCount);
                Runnable runner = new Runnable() {
                  public void run() {
                  	try {
                  		tab.editorPane.setPage(html.url);
                   	  Launcher.setLinksEnabled(tab.editorPane, html.hyperlinksEnabled);
                  	} catch(IOException ex) {
                      OSPLog.fine(LaunchRes.getString("Log.Message.BadURL")+" "+html.url); //$NON-NLS-1$ //$NON-NLS-2$
                    } 
                  }
                };
                SwingUtilities.invokeLater(runner);
                if (!isBuilder) {
                  String title = html.title == null? noTitle: html.title;
              	  htmlTabs.addTab(title, tab.scroller);
              	  tabCount++;
                }
              }
            } catch(IOException ex) {
              OSPLog.fine(LaunchRes.getString("Log.Message.BadURL")+" "+html.url); //$NON-NLS-1$ //$NON-NLS-2$
            }         			
    	  }
    	}
      if (!isBuilder) {
        if (htmlTabs.getTabCount() == 1 &&
        				htmlTabs.getTitleAt(0).equals(noTitle)) {
          splitPane.setRightComponent(htmlTabs.getComponentAt(0));
        }
        else if (htmlTabs.getTabCount() > 0) {
          splitPane.setRightComponent(htmlTabs);
          if (htmlTabs.getTabCount() > pageNumber) {
          	htmlTabs.setSelectedIndex(pageNumber);
          }
        }
        else if (!descriptionPane.getText().equals(node.description)){
          descriptionPane.setText(node.description);
        	splitPane.setRightComponent(descriptionScroller);
        }
      }
    }
  }

  /**
   * Creates the GUI.
   */
  protected void createGUI() {
    setPreferredSize(new Dimension(400, 200));
    setLayout(new BorderLayout());
    splitPane = new JSplitPane();
    add(splitPane, BorderLayout.CENTER);
    dataPanel = new JPanel(new BorderLayout());
    descriptionPane = new JTextPane();
  	descriptionPane.setEditable(false);
  	descriptionPane.setContentType(LaunchPanel.TEXT_TYPE);
    descriptionScroller = new JScrollPane(descriptionPane);    	
    // create the tabbed pane
    htmlTabs = new JTabbedPane(SwingConstants.TOP);
    htmlTabs.addChangeListener(new ChangeListener() {
      public void stateChanged(ChangeEvent e) {
         LaunchNode node = getSelectedNode();
         if (node != null) 
        	 node.htmlIndex = htmlTabs.getSelectedIndex();
      }
    });
    splitPane.setRightComponent(dataPanel);
    splitPane.setDividerLocation(160);
  }

  /**
   * Creates the tree.
   *
   * @param rootNode the root node
   */
  protected void createTree(LaunchNode rootNode) {
    // if not showing all nodes, create the VisibleNode structure
    if(!showAllNodes) {
      VisibleNode visibleRoot = new VisibleNode(rootNode);
      visibleNodeMap.put(rootNode, visibleRoot);
      addVisibleNodes(visibleRoot);
    }
    treeModel = new LaunchTreeModel(rootNode);
    tree = new JTree(treeModel);
    tree.setToolTipText(""); // enables tool tips for nodes //$NON-NLS-1$
    tree.setRootVisible(!rootNode.hiddenWhenRoot);
    tree.getSelectionModel().setSelectionMode(TreeSelectionModel.SINGLE_TREE_SELECTION);
    tree.addTreeSelectionListener(new TreeSelectionListener() {
      public void valueChanged(TreeSelectionEvent e) {
      	LaunchNode node = getSelectedNode();
        displayHTML(node);
      }
    });
    // put tree in a scroller and add to the split pane
    JScrollPane treeScroller = new JScrollPane(tree);
    splitPane.setLeftComponent(treeScroller);
  }

  /**
   * A tree model class for launch nodes.
   */
  class LaunchTreeModel extends DefaultTreeModel {
    LaunchTreeModel(LaunchNode root) {
      super(root);
    }

    public Object getChild(Object parent, int index) {
      if(showAllNodes) {
        return super.getChild(parent, index);
      }
      VisibleNode visibleParent = (VisibleNode) visibleNodeMap.get(parent);
      if(visibleParent!=null) {
        VisibleNode visibleChild = (VisibleNode) visibleParent.getChildAt(index);
        if(visibleChild!=null) {
          return visibleChild.node;
        }
      }
      return null;
    }

    public int getChildCount(Object parent) {
      if(showAllNodes) {
        return super.getChildCount(parent);
      }
      VisibleNode visibleParent = (VisibleNode) visibleNodeMap.get(parent);
      if(visibleParent!=null) {
        return visibleParent.getChildCount();
      }
      return 0;
    }

    public int getIndexOfChild(Object parent, Object child) {
      if(showAllNodes) {
        return super.getIndexOfChild(parent, child);
      }
      VisibleNode visibleParent = (VisibleNode) visibleNodeMap.get(parent);
      VisibleNode visibleChild = (VisibleNode) visibleNodeMap.get(child);
      if(visibleParent!=null&&visibleChild!=null) {
        return visibleParent.getIndex(visibleChild);
      }
      return -1;
    }
  }

  /**
   * A tree node that references a launch node.
   */
  private class VisibleNode extends DefaultMutableTreeNode {
    LaunchNode node;

    VisibleNode(LaunchNode node) {
      this.node = node;
    }
  }

  private void addVisibleNodes(VisibleNode visibleParent) {
    int n = visibleParent.node.getChildCount();
    for(int i = 0;i<n;i++) {
      LaunchNode child = (LaunchNode) visibleParent.node.getChildAt(i);
      if(child.isHiddenInLauncher()) {
        continue;
      }
      VisibleNode visibleChild = new VisibleNode(child);
      visibleNodeMap.put(child, visibleChild);
      visibleParent.add(visibleChild);
      addVisibleNodes(visibleChild);
    }
  }
}

/* 
 * Open Source Physics software is free software; you can redistribute
 * it and/or modify it under the terms of the GNU General Public License (GPL) as
 * published by the Free Software Foundation; either version 2 of the License,
 * or(at your option) any later version.

 * Code that uses any portion of the code in the org.opensourcephysics package
 * or any subpackage (subdirectory) of this package must must also be be released
 * under the GNU GPL license.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston MA 02111-1307 USA
 * or view the license online at http://www.gnu.org/copyleft/gpl.html
 *
 * Copyright (c) 2007  The Open Source Physics project
 *                     http://www.opensourcephysics.org
 */
