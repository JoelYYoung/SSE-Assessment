; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_68b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_68_badData = external dso_local global i8*, align 8
@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_68_goodG2BData = external dso_local global i8*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !13, metadata !DIExpression()), !dbg !16
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_68_badData, align 8, !dbg !17
  store i8* %0, i8** %data, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !18, metadata !DIExpression()), !dbg !23
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !23
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !23
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !24
  %2 = load i8*, i8** %data, align 8, !dbg !25
  %3 = load i8*, i8** %data, align 8, !dbg !26
  %call = call i64 @strlen(i8* %3) #6, !dbg !27
  %call1 = call i8* @strncpy(i8* %arraydecay, i8* %2, i64 %call) #7, !dbg !28
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !29
  store i8 0, i8* %arrayidx, align 1, !dbg !30
  %4 = load i8*, i8** %data, align 8, !dbg !31
  call void @printLine(i8* %4), !dbg !32
  %5 = load i8*, i8** %data, align 8, !dbg !33
  call void @free(i8* %5) #7, !dbg !34
  ret void, !dbg !35
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i8* @strncpy(i8*, i8*, i64) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_68b_goodG2BSink() #0 !dbg !36 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !37, metadata !DIExpression()), !dbg !38
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_68_goodG2BData, align 8, !dbg !39
  store i8* %0, i8** %data, align 8, !dbg !38
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !42
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !42
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !43
  %2 = load i8*, i8** %data, align 8, !dbg !44
  %3 = load i8*, i8** %data, align 8, !dbg !45
  %call = call i64 @strlen(i8* %3) #6, !dbg !46
  %call1 = call i8* @strncpy(i8* %arraydecay, i8* %2, i64 %call) #7, !dbg !47
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 49, !dbg !48
  store i8 0, i8* %arrayidx, align 1, !dbg !49
  %4 = load i8*, i8** %data, align 8, !dbg !50
  call void @printLine(i8* %4), !dbg !51
  %5 = load i8*, i8** %data, align 8, !dbg !52
  call void @free(i8* %5) #7, !dbg !53
  ret void, !dbg !54
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_68b_badSink", scope: !10, file: !10, line: 28, type: !11, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 30, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocation(line: 30, column: 12, scope: !9)
!17 = !DILocation(line: 30, column: 19, scope: !9)
!18 = !DILocalVariable(name: "dest", scope: !19, file: !10, line: 32, type: !20)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 31, column: 5)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 32, column: 14, scope: !19)
!24 = !DILocation(line: 34, column: 17, scope: !19)
!25 = !DILocation(line: 34, column: 23, scope: !19)
!26 = !DILocation(line: 34, column: 36, scope: !19)
!27 = !DILocation(line: 34, column: 29, scope: !19)
!28 = !DILocation(line: 34, column: 9, scope: !19)
!29 = !DILocation(line: 35, column: 9, scope: !19)
!30 = !DILocation(line: 35, column: 20, scope: !19)
!31 = !DILocation(line: 36, column: 19, scope: !19)
!32 = !DILocation(line: 36, column: 9, scope: !19)
!33 = !DILocation(line: 37, column: 14, scope: !19)
!34 = !DILocation(line: 37, column: 9, scope: !19)
!35 = !DILocation(line: 39, column: 1, scope: !9)
!36 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_ncpy_68b_goodG2BSink", scope: !10, file: !10, line: 46, type: !11, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!37 = !DILocalVariable(name: "data", scope: !36, file: !10, line: 48, type: !14)
!38 = !DILocation(line: 48, column: 12, scope: !36)
!39 = !DILocation(line: 48, column: 19, scope: !36)
!40 = !DILocalVariable(name: "dest", scope: !41, file: !10, line: 50, type: !20)
!41 = distinct !DILexicalBlock(scope: !36, file: !10, line: 49, column: 5)
!42 = !DILocation(line: 50, column: 14, scope: !41)
!43 = !DILocation(line: 52, column: 17, scope: !41)
!44 = !DILocation(line: 52, column: 23, scope: !41)
!45 = !DILocation(line: 52, column: 36, scope: !41)
!46 = !DILocation(line: 52, column: 29, scope: !41)
!47 = !DILocation(line: 52, column: 9, scope: !41)
!48 = !DILocation(line: 53, column: 9, scope: !41)
!49 = !DILocation(line: 53, column: 20, scope: !41)
!50 = !DILocation(line: 54, column: 19, scope: !41)
!51 = !DILocation(line: 54, column: 9, scope: !41)
!52 = !DILocation(line: 55, column: 14, scope: !41)
!53 = !DILocation(line: 55, column: 9, scope: !41)
!54 = !DILocation(line: 57, column: 1, scope: !36)
