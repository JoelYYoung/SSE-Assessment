; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_54a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_54a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_54_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  store i8* null, i8** %data, align 8, !dbg !19
  %call = call noalias align 16 i8* @malloc(i64 10) #4, !dbg !20
  store i8* %call, i8** %data, align 8, !dbg !21
  %0 = load i8*, i8** %data, align 8, !dbg !22
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_54b_badSink(i8* %0), !dbg !23
  ret void, !dbg !24
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_54b_badSink(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_54_good() #0 !dbg !25 {
entry:
  call void @goodG2B(), !dbg !26
  ret void, !dbg !27
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !28 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !33, metadata !DIExpression()), !dbg !34
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !35, metadata !DIExpression()), !dbg !36
  %call = call i64 @time(i64* null) #4, !dbg !37
  %conv = trunc i64 %call to i32, !dbg !38
  call void @srand(i32 %conv) #4, !dbg !39
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !40
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_54_good(), !dbg !41
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !42
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !43
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_54_bad(), !dbg !44
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !45
  ret i32 0, !dbg !46
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !47 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !48, metadata !DIExpression()), !dbg !49
  store i8* null, i8** %data, align 8, !dbg !50
  %call = call noalias align 16 i8* @malloc(i64 11) #4, !dbg !51
  store i8* %call, i8** %data, align 8, !dbg !52
  %0 = load i8*, i8** %data, align 8, !dbg !53
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_54b_goodG2BSink(i8* %0), !dbg !54
  ret void, !dbg !55
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_54b_goodG2BSink(i8*) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_54a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_54_bad", scope: !14, file: !14, line: 31, type: !15, scopeLine: 32, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_54a.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 33, type: !4)
!18 = !DILocation(line: 33, column: 12, scope: !13)
!19 = !DILocation(line: 34, column: 10, scope: !13)
!20 = !DILocation(line: 36, column: 20, scope: !13)
!21 = !DILocation(line: 36, column: 10, scope: !13)
!22 = !DILocation(line: 37, column: 74, scope: !13)
!23 = !DILocation(line: 37, column: 5, scope: !13)
!24 = !DILocation(line: 38, column: 1, scope: !13)
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_memmove_54_good", scope: !14, file: !14, line: 57, type: !15, scopeLine: 58, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DILocation(line: 59, column: 5, scope: !25)
!27 = !DILocation(line: 60, column: 1, scope: !25)
!28 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 72, type: !29, scopeLine: 73, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!29 = !DISubroutineType(types: !30)
!30 = !{!31, !31, !32}
!31 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!32 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!33 = !DILocalVariable(name: "argc", arg: 1, scope: !28, file: !14, line: 72, type: !31)
!34 = !DILocation(line: 72, column: 14, scope: !28)
!35 = !DILocalVariable(name: "argv", arg: 2, scope: !28, file: !14, line: 72, type: !32)
!36 = !DILocation(line: 72, column: 27, scope: !28)
!37 = !DILocation(line: 75, column: 22, scope: !28)
!38 = !DILocation(line: 75, column: 12, scope: !28)
!39 = !DILocation(line: 75, column: 5, scope: !28)
!40 = !DILocation(line: 77, column: 5, scope: !28)
!41 = !DILocation(line: 78, column: 5, scope: !28)
!42 = !DILocation(line: 79, column: 5, scope: !28)
!43 = !DILocation(line: 82, column: 5, scope: !28)
!44 = !DILocation(line: 83, column: 5, scope: !28)
!45 = !DILocation(line: 84, column: 5, scope: !28)
!46 = !DILocation(line: 86, column: 5, scope: !28)
!47 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 48, type: !15, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!48 = !DILocalVariable(name: "data", scope: !47, file: !14, line: 50, type: !4)
!49 = !DILocation(line: 50, column: 12, scope: !47)
!50 = !DILocation(line: 51, column: 10, scope: !47)
!51 = !DILocation(line: 53, column: 20, scope: !47)
!52 = !DILocation(line: 53, column: 10, scope: !47)
!53 = !DILocation(line: 54, column: 78, scope: !47)
!54 = !DILocation(line: 54, column: 5, scope: !47)
!55 = !DILocation(line: 55, column: 1, scope: !47)
