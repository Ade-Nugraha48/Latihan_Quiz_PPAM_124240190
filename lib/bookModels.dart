// lib/bookModels.dart
class BookModel {
  final String title;
  final String author;
  final int year;
  final String description;
  final String genre;
  final String publisher;
  final int pages;
  final double rating;
  final String imageUrl;
  final String bookUrl;

  BookModel({
    required this.title,
    required this.author,
    required this.year,
    required this.description,
    required this.genre,
    required this.publisher,
    required this.pages,
    required this.rating,
    required this.imageUrl,
    required this.bookUrl,
  });
}

List<BookModel> bookList = [
  BookModel(
    title: "Harry Potter and the Philosopher's Stone",
    author: "J.K. Rowling",
    year: 1997,
    description:
        "Harry Potter is an ordinary boy who lives with his unpleasant aunt, uncle, and cousin. On his eleventh birthday, Harry discovers that he is actually a wizard and is invited to attend Hogwarts School of Witchcraft and Wizardry. There, he begins a magical adventure and discovers the truth about his past.",
    genre: "Fantasy",
    publisher: "Bloomsbury",
    pages: 223,
    rating: 4.8,
    imageUrl:
        "https://images-na.ssl-images-amazon.com/images/I/81iqZ2HHD-L.jpg",
    bookUrl:
        "https://en.wikipedia.org/wiki/Harry_Potter_and_the_Philosopher%27s_Stone",
  ),

  BookModel(
    title: "The Hobbit",
    author: "J.R.R. Tolkien",
    year: 1937,
    description:
        "Bilbo Baggins is a peaceful hobbit whose life changes when the wizard Gandalf and a group of dwarves arrive at his home. They invite Bilbo to join an adventure to reclaim the dwarves' homeland and treasure from the dragon Smaug.",
    genre: "Fantasy",
    publisher: "George Allen & Unwin",
    pages: 310,
    rating: 4.7,
    imageUrl:
        "https://images-na.ssl-images-amazon.com/images/I/91b1Y3G2QJL.jpg",
    bookUrl: "https://en.wikipedia.org/wiki/The_Hobbit",
  ),

  BookModel(
    title: "Pride and Prejudice",
    author: "Jane Austen",
    year: 1813,
    description:
        "The story follows Elizabeth Bennet as she navigates relationships, family expectations, and social pressures in nineteenth-century England. Her first impressions of the wealthy and seemingly arrogant Mr. Darcy gradually change as they learn more about each other.",
    genre: "Romance",
    publisher: "T. Egerton",
    pages: 432,
    rating: 4.6,
    imageUrl:
        "https://images-na.ssl-images-amazon.com/images/I/71Q1tP4e4tL.jpg",
    bookUrl: "https://en.wikipedia.org/wiki/Pride_and_Prejudice",
  ),

  BookModel(
    title: "The Great Gatsby",
    author: "F. Scott Fitzgerald",
    year: 1925,
    description:
        "Nick Carraway moves to Long Island and becomes fascinated by his mysterious and wealthy neighbor, Jay Gatsby. Through Gatsby's lavish parties and his desire to reunite with Daisy Buchanan, the novel explores ambition, love, wealth, and the American Dream.",
    genre: "Classic",
    publisher: "Charles Scribner's Sons",
    pages: 180,
    rating: 4.5,
    imageUrl:
        "https://images-na.ssl-images-amazon.com/images/I/81af%2BMCATTL.jpg",
    bookUrl: "https://en.wikipedia.org/wiki/The_Great_Gatsby",
  ),

  BookModel(
    title: "1984",
    author: "George Orwell",
    year: 1949,
    description:
        "Winston Smith lives in a dystopian society controlled by the Party, where citizens are constantly monitored and independent thought is forbidden. As Winston secretly questions the system, he begins a dangerous journey against the oppressive government.",
    genre: "Dystopian",
    publisher: "Secker & Warburg",
    pages: 328,
    rating: 4.7,
    imageUrl:
        "https://images-na.ssl-images-amazon.com/images/I/71kxa1-0mfL.jpg",
    bookUrl: "https://en.wikipedia.org/wiki/Nineteen_Eighty-Four",
  ),

  BookModel(
    title: "The Alchemist",
    author: "Paulo Coelho",
    year: 1988,
    description:
        "Santiago, a young shepherd from Spain, dreams of finding a hidden treasure near the Egyptian pyramids. His journey takes him across the desert, where he meets different people and learns about following dreams, discovering purpose, and listening to his heart.",
    genre: "Adventure",
    publisher: "HarperCollins",
    pages: 208,
    rating: 4.6,
    imageUrl:
        "https://images-na.ssl-images-amazon.com/images/I/71aFt4%2BOTOL.jpg",
    bookUrl: "https://en.wikipedia.org/wiki/The_Alchemist_(novel)",
  ),

  BookModel(
    title: "To Kill a Mockingbird",
    author: "Harper Lee",
    year: 1960,
    description:
        "Scout Finch grows up in a small Alabama town during the 1930s. Through her father's defense of a Black man accused of a serious crime, Scout begins to understand prejudice, justice, compassion, and the complexities of society.",
    genre: "Historical Fiction",
    publisher: "J. B. Lippincott & Co.",
    pages: 281,
    rating: 4.8,
    imageUrl:
        "https://images-na.ssl-images-amazon.com/images/I/81OdwZQZ4YL.jpg",
    bookUrl: "https://en.wikipedia.org/wiki/To_Kill_a_Mockingbird",
  ),

  BookModel(
    title: "The Little Prince",
    author: "Antoine de Saint-Exupéry",
    year: 1943,
    description:
        "A pilot stranded in the Sahara Desert meets a mysterious young prince from another planet. Through their conversations, the prince shares stories about his travels and the unusual people he has encountered, offering lessons about friendship, love, and what truly matters in life.",
    genre: "Fiction",
    publisher: "Reynal & Hitchcock",
    pages: 96,
    rating: 4.9,
    imageUrl:
        "https://images-na.ssl-images-amazon.com/images/I/71OZY035QTL.jpg",
    bookUrl: "https://en.wikipedia.org/wiki/The_Little_Prince",
  ),
];