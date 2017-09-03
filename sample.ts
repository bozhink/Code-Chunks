let someVariable: string;
let someArray: Array<string>;

function someFunction(): void {
    let someVariable: number;
    someVariable = 2;
    console.log(someVariable);
    return;
}

let x = 10;

someVariable = x.toString();
console.log(x);

someFunction();

let sentence: string = `Hello, my name is ${someVariable}.
    I'll be ${x + 1} years old next month.`;

let kvp: [string, number][] = [
    ['key', 1],
    ['key1', 2]
];

for (let k of kvp) {
    console.log(`There is a key ${k[0]} with a corresponding value ${k[1]}`);
}

enum Color {
    Red = 1,
    Green = 3,
    Blue = 5
};

let color: Color = Color.Blue;

console.log(color);

let colorName: string = Color[3];

console.log(colorName);

function printLabel(labelObject: { label: string }) {
    console.log(labelObject.label);
}

let myObject = { size: 10, label: 'Size 10 Object' };
printLabel(myObject);

interface LabelledValue {
    label: string;
}

function printLabel1(labelObject: LabelledValue) {
    console.log(labelObject.label);
}

printLabel1(myObject);

interface SquareConfig {
    color?: string;
    width?: number;
}

interface Square {
    color: string;
    area: number;
}

function createSquare(config: SquareConfig): Square {
    let newSquare: Square = { color: 'white', area: 100 };
    if (config.color) {
        newSquare.color = config.color;
    }

    if (config.width) {
        newSquare.area = config.width * config.width;
    }

    return newSquare;
}



interface Point {
    readonly x: number;
    readonly y: number;
}

let p1: Point = { x: 10, y: 20 };

let a: number[] = [1, 2, 3, 4];
let r: ReadonlyArray<number> = a;
a = r as number[];


interface ClockInterface {
    currentTime: Date;
    setTime(d: Date);
}

class Clock implements ClockInterface {
    currentTime: Date;
    constructor(h: number, m: number) {
        //
    }

    setTime(d: Date) {
        this.currentTime = d;
    }
}

interface ClockInterface1 {
    tick();
}

interface ClockConstructor {
    new (hour: number, minute: number): ClockInterface1;
}

function createClock(ctor: ClockConstructor, hour: number, minute: number): ClockInterface1 {
    return new ctor(hour, minute);
}

class DigitalClock implements ClockInterface1 {

    constructor(h: number, n: number) {
    }

    tick() {
        console.log('beep beep');
    }
}

class AnalogClock implements ClockInterface1 {
    constructor(h: number, m: number) {
    }

    tick() {
        console.log('tik tok');
    }
}

let digital = createClock(DigitalClock, 12, 17);
let analog = createClock(AnalogClock, 7, 32);

interface SearchFunc {
    (source: string, subString: string): boolean;
}

let mySearch: SearchFunc;
mySearch = function (source: string, subString: string): boolean {
    let result = source.search(subString);
    return result > 1;
}

interface StringArray {
    [index: number]: string;
    length: number;
}

let myArray: StringArray;
myArray = ['Bob', 'Fred'];
let myString: string = myArray[0];

class Animal {
    name: string;
}

class Dog extends Animal {
    breed: string;
}

// // Error: indexing with a 'string' will sometimes get you a Dog
// interface NotOkay {
//     [x: number]: Animal;
//     [x: string]: Dog;
// }

interface Okay {
    [x: number]: Dog;
    [x: string]: Animal;
}

interface NumberDictionary {
    [index: string]: number;
    length: number; // ok, length is a number
    // name: string; // error, the type of 'name' is not a subtype of the indexer
}

interface ReadonlyStringArray {
    readonly [indexer: number]: string;
}

let myArray2: ReadonlyStringArray = ['Alice', 'Bob'];
// myArray2[2] = 'Mallory'; // Error

// Classes
class Greeter {
    greeting: string;

    constructor(message: string) {
        this.greeting = message;
    }

    greet() {
        return `Hello, ${this.greeting}`;
    }
}

let greeter = new Greeter('world');
console.log(greeter.greet());

let passCode = 'secret passCode';

// class Employee {
//     private _fullName: string;

//     get fullName(): string {
//         return this._fullName;
//     }

//     set fullName(newName: string) {
//         if (passCode && passCode === 'secret passCode') {
//             this._fullName = newName;
//         } else {
//             console.log('Error: Unauthorized update of employee!');
//         }
//     }
// }

// let employee = new Employee();
// employee.fullName = 'Bob Smith';
// if (employee.fullName) {
//     console.log(employee.fullName);
// }

class Grid {
    static origin = { x: 0, y: 0 };

    constructor(public scale: number) { }

    calculateDistanceFromOrigin(point: { x: number, y: number }) {
        let dx = point.x - Grid.origin.x;
        let dy = point.y - Grid.origin.y;
        return Math.sqrt(dx * dx + dy * dy) / this.scale;
    }
}

let grid1 = new Grid(1.0); // 1x scale
let grid2 = new Grid(5.0); // %x scale
console.log(grid1.calculateDistanceFromOrigin({ x: 10, y: 10 }));
console.log(grid2.calculateDistanceFromOrigin({ x: 10, y: 10 }));

