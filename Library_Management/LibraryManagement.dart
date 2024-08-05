class Book {
  String title;
  String author;
  String isbNo;
  bool isAvialable;

  Book(this.title, this.author, this.isbNo, this.isAvialable);
}

class Library {
  List<Book> books = [];

  void addBooks(Book book) {
    books.add(book);
  }

  void listBook() {
    print("-----------All Books------------");
    books.forEach((book) {
      print(
          'Title: ${book.title}, Author: ${book.author}, ISBno: ${book.isbNo}, Avialable: ${book.isAvialable}');
    });
  }

  void listLoanedBook() {
    print("-----------Loaned Books------------");
    for (var loan in loans) {
      print(
          'Title: ${loan.book.title}, Author: ${loan.book.author}, ISBno: ${loan.book.isbNo}, Avialable: ${loan.book.isAvialable}');
    }
  }

  List<Loan> loans = [];

  void loanBook(Book book, Member member) {
    if (book.isAvialable) {
      book.isAvialable = false;
      loans.add(Loan(book, member, DateTime.now()));
    } else {
      print('${book.title} is not avialabe');
    }
  }
}

class Member {
  String name;
  String memberId;

  Member(this.name, this.memberId);
}

class Loan {
  Book book;
  Member member;
  DateTime loanDate;
  DateTime? returnDate;

  Loan(this.book, this.member, this.loanDate, [this.returnDate]);

  void returnBook() {
    returnDate = DateTime.now();
    book.isAvialable = true;
  }
}

void main() {
  Book b1 = new Book("1990", "Marson", "100", true);
  Book b2 = new Book("1994", "Virat", "101", true);
  Book b3 = new Book("1998", "Rohit", "102", true);

  Library library = new Library();
  library.addBooks(b1);
  library.addBooks(b2);
  library.addBooks(b3);

  library.listBook();

  Member m1 = new Member("Razz", "101");
  library.loanBook(b2, m1);

  library.listBook();
  library.listLoanedBook();
}
