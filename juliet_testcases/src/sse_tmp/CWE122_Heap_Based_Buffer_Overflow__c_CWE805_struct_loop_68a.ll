; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68_badData = dso_local global %struct._twoIntsStruct* null, align 8, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68_goodG2BData = dso_local global %struct._twoIntsStruct* null, align 8, !dbg !16

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68_bad() #0 !dbg !25 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !28, metadata !DIExpression()), !dbg !29
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !31
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !33
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !34
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68_badData, align 8, !dbg !35
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68b_badSink(), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68b_badSink(...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68_good() #0 !dbg !38 {
entry:
  call void @goodG2B(), !dbg !39
  ret void, !dbg !40
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !41 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !47, metadata !DIExpression()), !dbg !48
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !49, metadata !DIExpression()), !dbg !50
  %call = call i64 @time(i64* null) #4, !dbg !51
  %conv = trunc i64 %call to i32, !dbg !52
  call void @srand(i32 %conv) #4, !dbg !53
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !54
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68_good(), !dbg !55
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !57
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68_bad(), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !59
  ret i32 0, !dbg !60
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !61 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !62, metadata !DIExpression()), !dbg !63
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !64
  %call = call noalias align 16 i8* @malloc(i64 800) #4, !dbg !65
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !66
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !67
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !68
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68_goodG2BData, align 8, !dbg !69
  call void (...) @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68b_goodG2BSink(), !dbg !70
  ret void, !dbg !71
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68b_goodG2BSink(...) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68_badData", scope: !2, file: !18, line: 19, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !15, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68a.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !14}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !8, line: 100, baseType: !9)
!8 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !8, line: 96, size: 64, elements: !10)
!10 = !{!11, !13}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !9, file: !8, line: 98, baseType: !12, size: 32)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !9, file: !8, line: 99, baseType: !12, size: 32, offset: 32)
!14 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!15 = !{!0, !16}
!16 = !DIGlobalVariableExpression(var: !17, expr: !DIExpression())
!17 = distinct !DIGlobalVariable(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68_goodG2BData", scope: !2, file: !18, line: 20, type: !6, isLocal: false, isDefinition: true)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68a.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"clang version 13.0.0"}
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68_bad", scope: !18, file: !18, line: 27, type: !26, scopeLine: 28, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocalVariable(name: "data", scope: !25, file: !18, line: 29, type: !6)
!29 = !DILocation(line: 29, column: 21, scope: !25)
!30 = !DILocation(line: 30, column: 10, scope: !25)
!31 = !DILocation(line: 32, column: 29, scope: !25)
!32 = !DILocation(line: 32, column: 12, scope: !25)
!33 = !DILocation(line: 32, column: 10, scope: !25)
!34 = !DILocation(line: 33, column: 74, scope: !25)
!35 = !DILocation(line: 33, column: 72, scope: !25)
!36 = !DILocation(line: 34, column: 5, scope: !25)
!37 = !DILocation(line: 35, column: 1, scope: !25)
!38 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_68_good", scope: !18, file: !18, line: 55, type: !26, scopeLine: 56, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!39 = !DILocation(line: 57, column: 5, scope: !38)
!40 = !DILocation(line: 58, column: 1, scope: !38)
!41 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 70, type: !42, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!42 = !DISubroutineType(types: !43)
!43 = !{!12, !12, !44}
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!47 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !18, line: 70, type: !12)
!48 = !DILocation(line: 70, column: 14, scope: !41)
!49 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !18, line: 70, type: !44)
!50 = !DILocation(line: 70, column: 27, scope: !41)
!51 = !DILocation(line: 73, column: 22, scope: !41)
!52 = !DILocation(line: 73, column: 12, scope: !41)
!53 = !DILocation(line: 73, column: 5, scope: !41)
!54 = !DILocation(line: 75, column: 5, scope: !41)
!55 = !DILocation(line: 76, column: 5, scope: !41)
!56 = !DILocation(line: 77, column: 5, scope: !41)
!57 = !DILocation(line: 80, column: 5, scope: !41)
!58 = !DILocation(line: 81, column: 5, scope: !41)
!59 = !DILocation(line: 82, column: 5, scope: !41)
!60 = !DILocation(line: 84, column: 5, scope: !41)
!61 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 45, type: !26, scopeLine: 46, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!62 = !DILocalVariable(name: "data", scope: !61, file: !18, line: 47, type: !6)
!63 = !DILocation(line: 47, column: 21, scope: !61)
!64 = !DILocation(line: 48, column: 10, scope: !61)
!65 = !DILocation(line: 50, column: 29, scope: !61)
!66 = !DILocation(line: 50, column: 12, scope: !61)
!67 = !DILocation(line: 50, column: 10, scope: !61)
!68 = !DILocation(line: 51, column: 78, scope: !61)
!69 = !DILocation(line: 51, column: 76, scope: !61)
!70 = !DILocation(line: 52, column: 5, scope: !61)
!71 = !DILocation(line: 53, column: 1, scope: !61)
