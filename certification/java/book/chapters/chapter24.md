# INTERNATIONALIZATION AND LOCALIZATION

Internationalization (i18n) is the process of designing software so that it can be adapted to various languages and regions without engineering changes. Localization (l10n) involves adapting the internationalized software for a specific region or language.

### LOCALE

A `Locale` object represents a specific geographical, political, or cultural region:

```java
Locale usLocale = new Locale("en", "US");
Locale frLocale = new Locale("fr", "FR");
```

### RESOURCE BUNDLES

Resource bundles contain locale-specific data, such as messages and labels:

```java
ResourceBundle bundle = ResourceBundle.getBundle("Messages", usLocale);
String greeting = bundle.getString("greeting");
```

### CURRENCY

Java supports currency formatting and conversion based on locales:

```java
NumberFormat currencyFormatter = NumberFormat.getCurrencyInstance(frLocale);
double amount = 1234.56;
String formattedAmount = currencyFormatter.format(amount);
```

### TIME, DATES, AND CALENDARS

Java provides classes for handling time zones, dates, and calendars:

```java
TimeZone timeZone = TimeZone.getTimeZone("America/New_York");
Calendar calendar = Calendar.getInstance(timeZone);
Date currentDate = calendar.getTime();
```

### FORMATTING AND PARSING DATES AND TIMES

Java provides the `SimpleDateFormat` class for formatting and parsing dates and times:

```java
DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.LONG, usLocale);
String formattedDate = dateFormat.format(new Date());
```

### INTERNATIONALIZATION AND LOCALIZATION FOR TEXT

Java supports localized text display and handling through `ResourceBundle`, `MessageFormat`, and `Collator` classes:

```java
ResourceBundle bundle = ResourceBundle.getBundle("Messages", frLocale);
String formattedMessage = MessageFormat.format(bundle.getString("hello_message"), "Alice");
```

This manual provides a comprehensive overview of internationalization and localization in Java, covering `Locale` for representing regions, `ResourceBundle` for localized resources, currency formatting, time, dates, and calendars handling, formatting and parsing dates and times with `DateFormat` and `SimpleDateFormat`, and internationalization and localization techniques for text using `MessageFormat`, `Collator`, and `ResourceBundle`. For more detailed information, refer to the Java documentation and additional resources on Java internationalization and localization.
