import { TestBed } from '@angular/core/testing';

import { CardProductsServiceService } from './card-products.service';

describe('CardProductsServiceService', () => {
  let service: CardProductsServiceService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(CardProductsServiceService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
