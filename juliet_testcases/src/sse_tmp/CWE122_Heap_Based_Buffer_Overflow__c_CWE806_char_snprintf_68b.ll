; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_68b.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_68b.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_68_badData = external dso_local global i8*, align 8
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_68_goodG2BData = external dso_local global i8*, align 8

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_68b_badSink() #0 !dbg !9 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !13, metadata !DIExpression()), !dbg !16
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_68_badData, align 8, !dbg !17
  store i8* %0, i8** %data, align 8, !dbg !16
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !18, metadata !DIExpression()), !dbg !23
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !23
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !23
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !24
  %2 = load i8*, i8** %data, align 8, !dbg !25
  %call = call i64 @strlen(i8* %2) #6, !dbg !26
  %3 = load i8*, i8** %data, align 8, !dbg !27
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %3) #7, !dbg !28
  %4 = load i8*, i8** %data, align 8, !dbg !29
  call void @printLine(i8* %4), !dbg !30
  %5 = load i8*, i8** %data, align 8, !dbg !31
  call void @free(i8* %5) #7, !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @snprintf(i8*, i64, i8*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_68b_goodG2BSink() #0 !dbg !34 {
entry:
  %data = alloca i8*, align 8
  %dest = alloca [50 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !35, metadata !DIExpression()), !dbg !36
  %0 = load i8*, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_68_goodG2BData, align 8, !dbg !37
  store i8* %0, i8** %data, align 8, !dbg !36
  call void @llvm.dbg.declare(metadata [50 x i8]* %dest, metadata !38, metadata !DIExpression()), !dbg !40
  %1 = bitcast [50 x i8]* %dest to i8*, !dbg !40
  call void @llvm.memset.p0i8.i64(i8* align 16 %1, i8 0, i64 50, i1 false), !dbg !40
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dest, i64 0, i64 0, !dbg !41
  %2 = load i8*, i8** %data, align 8, !dbg !42
  %call = call i64 @strlen(i8* %2) #6, !dbg !43
  %3 = load i8*, i8** %data, align 8, !dbg !44
  %call1 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %arraydecay, i64 %call, i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i8* %3) #7, !dbg !45
  %4 = load i8*, i8** %data, align 8, !dbg !46
  call void @printLine(i8* %4), !dbg !47
  %5 = load i8*, i8** %data, align 8, !dbg !48
  call void @free(i8* %5) #7, !dbg !49
  ret void, !dbg !50
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_68b.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 7, !"uwtable", i32 1}
!7 = !{i32 7, !"frame-pointer", i32 2}
!8 = !{!"clang version 13.0.0"}
!9 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_68b_badSink", scope: !10, file: !10, line: 34, type: !11, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_68b.c", directory: "/home/joelyang/SSE-Assessment")
!11 = !DISubroutineType(types: !12)
!12 = !{null}
!13 = !DILocalVariable(name: "data", scope: !9, file: !10, line: 36, type: !14)
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!16 = !DILocation(line: 36, column: 12, scope: !9)
!17 = !DILocation(line: 36, column: 19, scope: !9)
!18 = !DILocalVariable(name: "dest", scope: !19, file: !10, line: 38, type: !20)
!19 = distinct !DILexicalBlock(scope: !9, file: !10, line: 37, column: 5)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !15, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 38, column: 14, scope: !19)
!24 = !DILocation(line: 40, column: 18, scope: !19)
!25 = !DILocation(line: 40, column: 31, scope: !19)
!26 = !DILocation(line: 40, column: 24, scope: !19)
!27 = !DILocation(line: 40, column: 44, scope: !19)
!28 = !DILocation(line: 40, column: 9, scope: !19)
!29 = !DILocation(line: 41, column: 19, scope: !19)
!30 = !DILocation(line: 41, column: 9, scope: !19)
!31 = !DILocation(line: 42, column: 14, scope: !19)
!32 = !DILocation(line: 42, column: 9, scope: !19)
!33 = !DILocation(line: 44, column: 1, scope: !9)
!34 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_snprintf_68b_goodG2BSink", scope: !10, file: !10, line: 51, type: !11, scopeLine: 52, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DILocalVariable(name: "data", scope: !34, file: !10, line: 53, type: !14)
!36 = !DILocation(line: 53, column: 12, scope: !34)
!37 = !DILocation(line: 53, column: 19, scope: !34)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !10, line: 55, type: !20)
!39 = distinct !DILexicalBlock(scope: !34, file: !10, line: 54, column: 5)
!40 = !DILocation(line: 55, column: 14, scope: !39)
!41 = !DILocation(line: 57, column: 18, scope: !39)
!42 = !DILocation(line: 57, column: 31, scope: !39)
!43 = !DILocation(line: 57, column: 24, scope: !39)
!44 = !DILocation(line: 57, column: 44, scope: !39)
!45 = !DILocation(line: 57, column: 9, scope: !39)
!46 = !DILocation(line: 58, column: 19, scope: !39)
!47 = !DILocation(line: 58, column: 9, scope: !39)
!48 = !DILocation(line: 59, column: 14, scope: !39)
!49 = !DILocation(line: 59, column: 9, scope: !39)
!50 = !DILocation(line: 61, column: 1, scope: !34)
