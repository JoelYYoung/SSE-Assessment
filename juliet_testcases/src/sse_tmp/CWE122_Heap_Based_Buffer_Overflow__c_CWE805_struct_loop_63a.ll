; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_63a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_63a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_63_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !25
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !26
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !27
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !28
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_63b_badSink(%struct._twoIntsStruct** %data), !dbg !29
  ret void, !dbg !30
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_63b_badSink(%struct._twoIntsStruct**) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_63_good() #0 !dbg !31 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !40, metadata !DIExpression()), !dbg !41
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !42, metadata !DIExpression()), !dbg !43
  %call = call i64 @time(i64* null) #4, !dbg !44
  %conv = trunc i64 %call to i32, !dbg !45
  call void @srand(i32 %conv) #4, !dbg !46
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !47
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_63_good(), !dbg !48
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !49
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !50
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_63_bad(), !dbg !51
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !52
  ret i32 0, !dbg !53
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !54 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !55, metadata !DIExpression()), !dbg !56
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !57
  %call = call noalias align 16 i8* @malloc(i64 800) #4, !dbg !58
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !59
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !60
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_63b_goodG2BSink(%struct._twoIntsStruct** %data), !dbg !61
  ret void, !dbg !62
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_63b_goodG2BSink(%struct._twoIntsStruct**) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_63a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !12}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "twoIntsStruct", file: !6, line: 100, baseType: !7)
!6 = !DIFile(filename: "./testcasesupport/std_testcase.h", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_twoIntsStruct", file: !6, line: 96, size: 64, elements: !8)
!8 = !{!9, !11}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "intOne", scope: !7, file: !6, line: 98, baseType: !10, size: 32)
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_member, name: "intTwo", scope: !7, file: !6, line: 99, baseType: !10, size: 32, offset: 32)
!12 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!13 = !{i32 7, !"Dwarf Version", i32 4}
!14 = !{i32 2, !"Debug Info Version", i32 3}
!15 = !{i32 1, !"wchar_size", i32 4}
!16 = !{i32 7, !"uwtable", i32 1}
!17 = !{i32 7, !"frame-pointer", i32 2}
!18 = !{!"clang version 13.0.0"}
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_63_bad", scope: !20, file: !20, line: 24, type: !21, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_63a.c", directory: "/home/joelyang/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 26, type: !4)
!24 = !DILocation(line: 26, column: 21, scope: !19)
!25 = !DILocation(line: 27, column: 10, scope: !19)
!26 = !DILocation(line: 29, column: 29, scope: !19)
!27 = !DILocation(line: 29, column: 12, scope: !19)
!28 = !DILocation(line: 29, column: 10, scope: !19)
!29 = !DILocation(line: 30, column: 5, scope: !19)
!30 = !DILocation(line: 31, column: 1, scope: !19)
!31 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_loop_63_good", scope: !20, file: !20, line: 49, type: !21, scopeLine: 50, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!32 = !DILocation(line: 51, column: 5, scope: !31)
!33 = !DILocation(line: 52, column: 1, scope: !31)
!34 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 64, type: !35, scopeLine: 65, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{!10, !10, !37}
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!40 = !DILocalVariable(name: "argc", arg: 1, scope: !34, file: !20, line: 64, type: !10)
!41 = !DILocation(line: 64, column: 14, scope: !34)
!42 = !DILocalVariable(name: "argv", arg: 2, scope: !34, file: !20, line: 64, type: !37)
!43 = !DILocation(line: 64, column: 27, scope: !34)
!44 = !DILocation(line: 67, column: 22, scope: !34)
!45 = !DILocation(line: 67, column: 12, scope: !34)
!46 = !DILocation(line: 67, column: 5, scope: !34)
!47 = !DILocation(line: 69, column: 5, scope: !34)
!48 = !DILocation(line: 70, column: 5, scope: !34)
!49 = !DILocation(line: 71, column: 5, scope: !34)
!50 = !DILocation(line: 74, column: 5, scope: !34)
!51 = !DILocation(line: 75, column: 5, scope: !34)
!52 = !DILocation(line: 76, column: 5, scope: !34)
!53 = !DILocation(line: 78, column: 5, scope: !34)
!54 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 40, type: !21, scopeLine: 41, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!55 = !DILocalVariable(name: "data", scope: !54, file: !20, line: 42, type: !4)
!56 = !DILocation(line: 42, column: 21, scope: !54)
!57 = !DILocation(line: 43, column: 10, scope: !54)
!58 = !DILocation(line: 45, column: 29, scope: !54)
!59 = !DILocation(line: 45, column: 12, scope: !54)
!60 = !DILocation(line: 45, column: 10, scope: !54)
!61 = !DILocation(line: 46, column: 5, scope: !54)
!62 = !DILocation(line: 47, column: 1, scope: !54)
