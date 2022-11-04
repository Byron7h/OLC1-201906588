import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VisorAstComponent } from './visor-ast.component';

describe('VisorAstComponent', () => {
  let component: VisorAstComponent;
  let fixture: ComponentFixture<VisorAstComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ VisorAstComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(VisorAstComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
