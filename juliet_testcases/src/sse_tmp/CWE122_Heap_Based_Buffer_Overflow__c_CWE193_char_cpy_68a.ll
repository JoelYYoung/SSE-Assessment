; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_68a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_68_badData = dso_local global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_68_goodG2BData = dso_local global i8* null, align 8, !dbg !10

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_68_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i8* null, i8** %data, align 8, !dbg !24
  %call = call noalias align 16 i8* @malloc(i64 10) #4, !dbg !25
  store i8* %call, i8** %data, align 8, !dbg !26
  %0 = load i8*, i8** %data, align 8, !dbg !27
  store i8* %0, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_68_badData, align 8, !dbg !28
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_68b_badSink(), !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_68b_badSink(...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_68_good() #0 !dbg !31 {
entry:
  call void @goodG2B(), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !34 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !39, metadata !DIExpression()), !dbg !40
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !41, metadata !DIExpression()), !dbg !42
  %call = call i64 @time(i64* null) #4, !dbg !43
  %conv = trunc i64 %call to i32, !dbg !44
  call void @srand(i32 %conv) #4, !dbg !45
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !46
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_68_good(), !dbg !47
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !48
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !49
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_68_bad(), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !51
  ret i32 0, !dbg !52
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !53 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !54, metadata !DIExpression()), !dbg !55
  store i8* null, i8** %data, align 8, !dbg !56
  %call = call noalias align 16 i8* @malloc(i64 11) #4, !dbg !57
  store i8* %call, i8** %data, align 8, !dbg !58
  %0 = load i8*, i8** %data, align 8, !dbg !59
  store i8* %0, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_68_goodG2BData, align 8, !dbg !60
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_68b_goodG2BSink(), !dbg !61
  ret void, !dbg !62
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_68b_goodG2BSink(...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_68_badData", scope: !2, file: !12, line: 26, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_68_goodG2BData", scope: !2, file: !12, line: 27, type: !6, isLocal: false, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_68a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_68_bad", scope: !12, file: !12, line: 34, type: !20, scopeLine: 35, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 36, type: !6)
!23 = !DILocation(line: 36, column: 12, scope: !19)
!24 = !DILocation(line: 37, column: 10, scope: !19)
!25 = !DILocation(line: 39, column: 20, scope: !19)
!26 = !DILocation(line: 39, column: 10, scope: !19)
!27 = !DILocation(line: 40, column: 71, scope: !19)
!28 = !DILocation(line: 40, column: 69, scope: !19)
!29 = !DILocation(line: 41, column: 5, scope: !19)
!30 = !DILocation(line: 42, column: 1, scope: !19)
!31 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE193_char_cpy_68_good", scope: !12, file: !12, line: 62, type: !20, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!32 = !DILocation(line: 64, column: 5, scope: !31)
!33 = !DILocation(line: 65, column: 1, scope: !31)
!34 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 77, type: !35, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!35 = !DISubroutineType(types: !36)
!36 = !{!37, !37, !38}
!37 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!39 = !DILocalVariable(name: "argc", arg: 1, scope: !34, file: !12, line: 77, type: !37)
!40 = !DILocation(line: 77, column: 14, scope: !34)
!41 = !DILocalVariable(name: "argv", arg: 2, scope: !34, file: !12, line: 77, type: !38)
!42 = !DILocation(line: 77, column: 27, scope: !34)
!43 = !DILocation(line: 80, column: 22, scope: !34)
!44 = !DILocation(line: 80, column: 12, scope: !34)
!45 = !DILocation(line: 80, column: 5, scope: !34)
!46 = !DILocation(line: 82, column: 5, scope: !34)
!47 = !DILocation(line: 83, column: 5, scope: !34)
!48 = !DILocation(line: 84, column: 5, scope: !34)
!49 = !DILocation(line: 87, column: 5, scope: !34)
!50 = !DILocation(line: 88, column: 5, scope: !34)
!51 = !DILocation(line: 89, column: 5, scope: !34)
!52 = !DILocation(line: 91, column: 5, scope: !34)
!53 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 52, type: !20, scopeLine: 53, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!54 = !DILocalVariable(name: "data", scope: !53, file: !12, line: 54, type: !6)
!55 = !DILocation(line: 54, column: 12, scope: !53)
!56 = !DILocation(line: 55, column: 10, scope: !53)
!57 = !DILocation(line: 57, column: 20, scope: !53)
!58 = !DILocation(line: 57, column: 10, scope: !53)
!59 = !DILocation(line: 58, column: 75, scope: !53)
!60 = !DILocation(line: 58, column: 73, scope: !53)
!61 = !DILocation(line: 59, column: 5, scope: !53)
!62 = !DILocation(line: 60, column: 1, scope: !53)
