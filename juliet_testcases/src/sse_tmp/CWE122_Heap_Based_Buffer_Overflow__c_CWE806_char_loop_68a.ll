; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_68a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_68_badData = dso_local global i8* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_68_goodG2BData = dso_local global i8* null, align 8, !dbg !10

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_68_bad() #0 !dbg !19 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !22, metadata !DIExpression()), !dbg !23
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !24
  store i8* %call, i8** %data, align 8, !dbg !25
  %0 = load i8*, i8** %data, align 8, !dbg !26
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 99, i1 false), !dbg !27
  %1 = load i8*, i8** %data, align 8, !dbg !28
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 99, !dbg !28
  store i8 0, i8* %arrayidx, align 1, !dbg !29
  %2 = load i8*, i8** %data, align 8, !dbg !30
  store i8* %2, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_68_badData, align 8, !dbg !31
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_68b_badSink(), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #3

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_68b_badSink(...) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_68_good() #0 !dbg !34 {
entry:
  call void @goodG2B(), !dbg !35
  ret void, !dbg !36
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !37 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !42, metadata !DIExpression()), !dbg !43
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !44, metadata !DIExpression()), !dbg !45
  %call = call i64 @time(i64* null) #5, !dbg !46
  %conv = trunc i64 %call to i32, !dbg !47
  call void @srand(i32 %conv) #5, !dbg !48
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !49
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_68_good(), !dbg !50
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !51
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !52
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_68_bad(), !dbg !53
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !54
  ret i32 0, !dbg !55
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !56 {
entry:
  %data = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !57, metadata !DIExpression()), !dbg !58
  %call = call noalias align 16 i8* @malloc(i64 100) #5, !dbg !59
  store i8* %call, i8** %data, align 8, !dbg !60
  %0 = load i8*, i8** %data, align 8, !dbg !61
  call void @llvm.memset.p0i8.i64(i8* align 1 %0, i8 65, i64 49, i1 false), !dbg !62
  %1 = load i8*, i8** %data, align 8, !dbg !63
  %arrayidx = getelementptr inbounds i8, i8* %1, i64 49, !dbg !63
  store i8 0, i8* %arrayidx, align 1, !dbg !64
  %2 = load i8*, i8** %data, align 8, !dbg !65
  store i8* %2, i8** @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_68_goodG2BData, align 8, !dbg !66
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_68b_goodG2BSink(), !dbg !67
  ret void, !dbg !68
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_68b_goodG2BSink(...) #4

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { argmemonly nofree nounwind willreturn writeonly }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_68_badData", scope: !2, file: !12, line: 21, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !9, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !8}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{!0, !10}
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_68_goodG2BData", scope: !2, file: !12, line: 22, type: !6, isLocal: false, isDefinition: true)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_68a.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_68_bad", scope: !12, file: !12, line: 29, type: !20, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !19, file: !12, line: 31, type: !6)
!23 = !DILocation(line: 31, column: 12, scope: !19)
!24 = !DILocation(line: 32, column: 20, scope: !19)
!25 = !DILocation(line: 32, column: 10, scope: !19)
!26 = !DILocation(line: 34, column: 12, scope: !19)
!27 = !DILocation(line: 34, column: 5, scope: !19)
!28 = !DILocation(line: 35, column: 5, scope: !19)
!29 = !DILocation(line: 35, column: 17, scope: !19)
!30 = !DILocation(line: 36, column: 72, scope: !19)
!31 = !DILocation(line: 36, column: 70, scope: !19)
!32 = !DILocation(line: 37, column: 5, scope: !19)
!33 = !DILocation(line: 38, column: 1, scope: !19)
!34 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE806_char_loop_68_good", scope: !12, file: !12, line: 59, type: !20, scopeLine: 60, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!35 = !DILocation(line: 61, column: 5, scope: !34)
!36 = !DILocation(line: 62, column: 1, scope: !34)
!37 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 74, type: !38, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!38 = !DISubroutineType(types: !39)
!39 = !{!40, !40, !41}
!40 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!41 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!42 = !DILocalVariable(name: "argc", arg: 1, scope: !37, file: !12, line: 74, type: !40)
!43 = !DILocation(line: 74, column: 14, scope: !37)
!44 = !DILocalVariable(name: "argv", arg: 2, scope: !37, file: !12, line: 74, type: !41)
!45 = !DILocation(line: 74, column: 27, scope: !37)
!46 = !DILocation(line: 77, column: 22, scope: !37)
!47 = !DILocation(line: 77, column: 12, scope: !37)
!48 = !DILocation(line: 77, column: 5, scope: !37)
!49 = !DILocation(line: 79, column: 5, scope: !37)
!50 = !DILocation(line: 80, column: 5, scope: !37)
!51 = !DILocation(line: 81, column: 5, scope: !37)
!52 = !DILocation(line: 84, column: 5, scope: !37)
!53 = !DILocation(line: 85, column: 5, scope: !37)
!54 = !DILocation(line: 86, column: 5, scope: !37)
!55 = !DILocation(line: 88, column: 5, scope: !37)
!56 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 48, type: !20, scopeLine: 49, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!57 = !DILocalVariable(name: "data", scope: !56, file: !12, line: 50, type: !6)
!58 = !DILocation(line: 50, column: 12, scope: !56)
!59 = !DILocation(line: 51, column: 20, scope: !56)
!60 = !DILocation(line: 51, column: 10, scope: !56)
!61 = !DILocation(line: 53, column: 12, scope: !56)
!62 = !DILocation(line: 53, column: 5, scope: !56)
!63 = !DILocation(line: 54, column: 5, scope: !56)
!64 = !DILocation(line: 54, column: 16, scope: !56)
!65 = !DILocation(line: 55, column: 76, scope: !56)
!66 = !DILocation(line: 55, column: 74, scope: !56)
!67 = !DILocation(line: 56, column: 5, scope: !56)
!68 = !DILocation(line: 57, column: 1, scope: !56)
