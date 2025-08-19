class NovelSubject {
  final String? key;
  final String? name;
  final String? subjectType;
  final int? workCount;
  final List<Work>? works;

  NovelSubject({
    this.key,
    this.name,
    this.subjectType,
    this.workCount,
    this.works,
  });

  factory NovelSubject.fromJson(Map<String, dynamic> json) {
    return NovelSubject(
      key: json['key'],
      name: json['name'],
      subjectType: json['subject_type'],
      workCount: json['work_count'],
      works: (json['works'] as List?)
          ?.map((e) => Work.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Work {
  final String? key;
  final String? title;
  final int? editionCount;
  final int? coverId;
  final String? coverEditionKey;
  final List<String>? subject;
  final List<String>? iaCollection;
  final bool? printdisabled;
  final String? lendingEdition;
  final String? lendingIdentifier;
  final List<Author>? authors;
  final int? firstPublishYear;
  final String? ia;
  final bool? publicScan;
  final bool? hasFulltext;
  final Availability? availability;
   bool? isFavourite;

  Work({
    this.key,
    this.title,
    this.editionCount,
    this.coverId,
    this.coverEditionKey,
    this.subject,
    this.iaCollection,
    this.printdisabled,
    this.lendingEdition,
    this.lendingIdentifier,
    this.authors,
    this.firstPublishYear,
    this.ia,
    this.publicScan,
    this.hasFulltext,
    this.availability,
    this.isFavourite ,
  });

  factory Work.fromJson(Map<String, dynamic> json) {
    return Work(
      key: json['key'],
      title: json['title'],
      editionCount: json['edition_count'],
      coverId: json['cover_id'],
      coverEditionKey: json['cover_edition_key'],
      subject: (json['subject'] as List?)?.map((e) => e.toString()).toList(),
      iaCollection: (json['ia_collection'] as List?)
          ?.map((e) => e.toString())
          .toList(),
      printdisabled: json['printdisabled'],
      lendingEdition: json['lending_edition'],
      lendingIdentifier: json['lending_identifier'],
      authors: (json['authors'] as List?)
          ?.map((e) => Author.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPublishYear: json['first_publish_year'],
      ia: json['ia'],
      publicScan: json['public_scan'],
      hasFulltext: json['has_fulltext'],
      availability: json['availability'] != null
          ? Availability.fromJson(json['availability'])
          : null,
          isFavourite: json['is_favourite'] ?? false,
    );
  }
   Map<String, dynamic> toJson() {
    return {
      'key': key,
      'title': title,
      'edition_count': editionCount,
      'cover_id': coverId,
      'cover_edition_key': coverEditionKey,
      'subject': subject,
      'ia_collection': iaCollection,
      'printdisabled': printdisabled,
      'lending_edition': lendingEdition,
      'lending_identifier': lendingIdentifier,
      'authors': authors?.map((e) => e.toJson()).toList(),
      'first_publish_year': firstPublishYear,
      'ia': ia,
      'public_scan': publicScan,
      'has_fulltext': hasFulltext,
      'availability': availability?.toJson(),
      'is_favourite': isFavourite ?? false,
    };
  }
}

class Author {
  final String? key;
  final String? name;

  Author({this.key, this.name});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(key: json['key'], name: json['name']);
  }
    Map<String, dynamic> toJson() {
    return {'key': key, 'name': name};
  }
}

class Availability {
  final String? status;
  final bool? availableToBrowse;
  final bool? availableToBorrow;
  final bool? availableToWaitlist;
  final bool? isPrintdisabled;
  final bool? isReadable;
  final bool? isLendable;
  final bool? isPreviewable;
  final String? identifier;
  final String? isbn;
  final String? oclc;
  final String? openlibraryWork;
  final String? openlibraryEdition;
  final String? lastLoanDate;
  final int? numWaitlist;
  final String? lastWaitlistDate;
  final bool? isRestricted;
  final bool? isBrowseable;

  Availability({
    this.status,
    this.availableToBrowse,
    this.availableToBorrow,
    this.availableToWaitlist,
    this.isPrintdisabled,
    this.isReadable,
    this.isLendable,
    this.isPreviewable,
    this.identifier,
    this.isbn,
    this.oclc,
    this.openlibraryWork,
    this.openlibraryEdition,
    this.lastLoanDate,
    this.numWaitlist,
    this.lastWaitlistDate,
    this.isRestricted,
    this.isBrowseable,
  });

  factory Availability.fromJson(Map<String, dynamic> json) {
    return Availability(
      status: json['status'],
      availableToBrowse: json['available_to_browse'],
      availableToBorrow: json['available_to_borrow'],
      availableToWaitlist: json['available_to_waitlist'],
      isPrintdisabled: json['is_printdisabled'],
      isReadable: json['is_readable'],
      isLendable: json['is_lendable'],
      isPreviewable: json['is_previewable'],
      identifier: json['identifier'],
      isbn: json['isbn'],
      oclc: json['oclc'],
      openlibraryWork: json['openlibrary_work'],
      openlibraryEdition: json['openlibrary_edition'],
      lastLoanDate: json['last_loan_date'],
      numWaitlist: json['num_waitlist'],
      lastWaitlistDate: json['last_waitlist_date'],
      isRestricted: json['is_restricted'],
      isBrowseable: json['is_browseable'],
    );
  }
    Map<String, dynamic> toJson() {
    return {
      'status': status,
      'available_to_browse': availableToBrowse,
      'available_to_borrow': availableToBorrow,
      'available_to_waitlist': availableToWaitlist,
      'is_printdisabled': isPrintdisabled,
      'is_readable': isReadable,
      'is_lendable': isLendable,
      'is_previewable': isPreviewable,
      'identifier': identifier,
      'isbn': isbn,
      'oclc': oclc,
      'openlibrary_work': openlibraryWork,
      'openlibrary_edition': openlibraryEdition,
      'last_loan_date': lastLoanDate,
      'num_waitlist': numWaitlist,
      'last_waitlist_date': lastWaitlistDate,
      'is_restricted': isRestricted,
      'is_browseable': isBrowseable,
    };
  }
}
