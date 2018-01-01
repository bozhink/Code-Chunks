using System;
using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;
using Santase.Logic.Cards;

namespace Santase.Logic.Tests
{
    [TestFixture]
    public class DeckTests
    {
        [Test]
        public void Deck_InNewInstance_CountOfCards_IsGreaterThanZero()
        {
            Deck deck = new Deck();
            Assert.Greater(deck.CardsLeft, 0, "New instance of Deck should contain moreathan zero cards.");
        }

        [Test]
        public void Deck_InNewInstance_ShouldContain24Cards()
        {
            Deck testDeck = new Deck();
            Assert.AreEqual(24, testDeck.CardsLeft, "New instance of Deck should contain 24 cards.");
        }

        [Test]
        public void Deck_InNewInstance_NextCard_IsNotNull()
        {
            Deck deck = new Deck();
            Card nextCard = deck.GetNextCard();
            Assert.IsNotNull(nextCard, "In new instance of Deck next card should not be null.");
        }

        [Test]
        public void Deck_InNewInstance_GetNextCard_ShouldReturnCardOfValidSuit()
        {
            Deck testDeck = new Deck();
            Assert.IsTrue(Enum.IsDefined(typeof(CardSuit), testDeck.GetNextCard().Suit), "Card must have one of the predefined suits.");
        }

        [Test]
        public void Deck_InNewInstance_GetNextCard_ShouldReturnCardOfValidType()
        {
            Deck testDeck = new Deck();
            Assert.IsTrue(Enum.IsDefined(typeof(CardType), testDeck.GetNextCard().Type), "Card must have one of the predefined types.");
        }

        [TestCase(4)]
        [TestCase(8)]
        [TestCase(15)]
        [TestCase(17)]
        [TestCase(24)]
        public void Deck_GetNextCard_ShouldReturnDifferentCards(int count)
        {
            Deck deck = new Deck();
            List<Card> cards = new List<Card>();

            for (int i = 0; i < count; ++i)
            {
                cards.Add(deck.GetNextCard());
            }

            IEnumerable<string> cardHashes = cards.Select(c => c.Suit.ToString() + c.Type.ToString());
            cardHashes = cardHashes.Distinct<string>();

            Assert.AreEqual(count, cardHashes.Count(), "GetNextCard should return different cards.");
        }

        [Test]
        public void Deck_InNewInstance_GettingTheNextCard_ShouldRemoveOneCardFromTheDeck()
        {
            Deck deck = new Deck();
            int numberOfCards = deck.CardsLeft;
            Card nextCard = deck.GetNextCard();
            Assert.AreEqual(numberOfCards - 1, deck.CardsLeft, "GetNextCard should remove 1 card from the deck.");
        }

        [TestCase(0)]
        [TestCase(1)]
        [TestCase(10)]
        [TestCase(24)]
        public void Deck_GettingCardsFromDeck_ShouldProperlyUpdateTheCountOfCardsLeft(int countOfCardsToGet)
        {
            Deck deck = new Deck();
            Card card = deck.GetNextCard();
            int cardsLeftCount = deck.CardsLeft;
            for (int i = 1; i < countOfCardsToGet; ++i)
            {
                card = deck.GetNextCard();
                --cardsLeftCount;
            }

            Assert.AreEqual(deck.CardsLeft, cardsLeftCount, "Getting cards from deck should properly update the count of cards left.");
        }

        [TestCase(24)]
        public void Deck_GetNextCard24Times_ShouldEmptyTheDeck(int cardsToBeDrawn)
        {
            Deck deck = new Deck();
            Card card;
            for (int i = 0; i < cardsToBeDrawn; ++i)
            {
                card = deck.GetNextCard();
            }

            Assert.AreEqual(0, deck.CardsLeft, "There should be no cards left in the deck after drawing 24 cards.");
        }

        [Test]
        public void Deck_GetInitialNumberOfCardsFromDeck_SchouldEmptyDeck()
        {
            Deck deck = new Deck();
            Card card;
            for (int i = 0, numberOfCards = deck.CardsLeft; i < numberOfCards; ++i)
            {
                card = deck.GetNextCard();
            }

            Assert.AreEqual(0, deck.CardsLeft, "There should be no cards left in the deck after drawing the initial number of cards.");
        }

        [Test]
        [ExpectedException(typeof(Santase.Logic.InternalGameException))]
        public void Deck_GetMoreCardsThanPresentInDeck_ShouldThrow()
        {
            Deck deck = new Deck();
            for (int i = 0; i < 10000; ++i)
            {
                Card card = deck.GetNextCard();
            }
        }

        [TestCase(25)]
        [ExpectedException(typeof(InternalGameException))]
        public void Deck_GetNextCard25Times_ShouldThrow(int cardsToBeDrawn)
        {
            Deck deck = new Deck();
            for (int i = 0; i < cardsToBeDrawn; ++i)
            {
                deck.GetNextCard();
            }
        }

        [Test]
        [ExpectedException(typeof(Santase.Logic.InternalGameException))]
        public void Deck_GetNextCardFromEmptyDeck_ShouldThrow()
        {
            Deck deck = new Deck();
            Card card;
            for (int i = 0, numberOfCards = deck.CardsLeft; i < numberOfCards; ++i)
            {
                card = deck.GetNextCard();
            }

            card = deck.GetNextCard();
        }

        [Test]
        public void Deck_TrumpCard_ShouldOfValidSuit()
        {
            Deck deck = new Deck();
            Assert.IsTrue(Enum.IsDefined(typeof(CardSuit), deck.GetTrumpCard.Suit), "Card must have one of the predefined suits.");
        }

        [Test]
        public void Deck_TrumpCard_ShouldOfValidType()
        {
            Deck deck = new Deck();
            Assert.IsTrue(Enum.IsDefined(typeof(CardType), deck.GetTrumpCard.Type), "Card must have one of the predefined types.");
        }

        [Test]
        public void Deck_TrumpCard_IsAtTheTopOfDeck()
        {
            Deck deck = new Deck();
            int numberOfCards = deck.CardsLeft;
            Card topCard = deck.GetNextCard();
            for (int i = 1; i < numberOfCards; ++i)
            {
                topCard = deck.GetNextCard();
            }

            Assert.AreEqual(topCard, deck.GetTrumpCard, "Top card and the trump card should be equal.");
            Assert.AreSame(topCard, deck.GetTrumpCard, "Top card and the trump card should be same.");
        }

        [Test]
        public void Deck_ChangeTrumpCardInNonEmptyDeck_ShouldChangeTheTrumpCard()
        {
            Deck deck = new Deck();
            Card initialTrumpCard = deck.GetTrumpCard;
            Card newCard = deck.GetNextCard();
            deck.ChangeTrumpCard(newCard);
            Assert.AreNotSame(initialTrumpCard, deck.GetTrumpCard, "ChangeTrumpCard should change the trump card when there are cards lwft in the deck.");
        }

        [TestCase(24)]
        public void Deck_ChangeTrumpCardInEmptyDeck_ShouldNotChangeTheTrumpCard(int cardsToBeDrawn)
        {
            Deck deck = new Deck();
            Card initialTrumpCard = deck.GetTrumpCard;
            for (int i = 0; i < cardsToBeDrawn - 1; ++i)
            {
                deck.GetNextCard();
            }

            deck.ChangeTrumpCard(deck.GetNextCard());

            Assert.AreSame(initialTrumpCard, deck.GetTrumpCard, "ChangeTrumpCard should not change the trump card when there are no cards left in the deck.");
        }

        [TestCase(CardSuit.Spade, CardType.King)]
        [TestCase(CardSuit.Heart, CardType.Ace)]
        [TestCase(CardSuit.Diamond, CardType.Jack)]
        [TestCase(CardSuit.Heart, CardType.Queen)]
        [TestCase(CardSuit.Diamond, CardType.Ten)]
        public void Deck_ChangeTrumpCard_ShouldProperlyUpdateBothTrumpCardAndDeckTopCard(CardSuit suit, CardType type)
        {
            Deck deck = new Deck();
            Card newTrumpCard = new Card(suit, type);
            deck.ChangeTrumpCard(newTrumpCard);
            int numberOfCards = deck.CardsLeft;
            Card topCard = deck.GetNextCard();
            for (int i = 1; i < numberOfCards; ++i)
            {
                topCard = deck.GetNextCard();
            }

            Assert.AreEqual(topCard, newTrumpCard, "ChangeTrumpCard shouls properly update both trump card and deck top card.");
        }
    }
}
