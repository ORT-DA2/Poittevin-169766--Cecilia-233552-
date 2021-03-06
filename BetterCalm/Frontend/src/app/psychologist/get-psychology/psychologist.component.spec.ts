import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PsychologyComponent } from './psychologist.component';

describe('PsychologistComponent', () => {
  let component: PsychologyComponent;
  let fixture: ComponentFixture<PsychologyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ PsychologyComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(PsychologyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
