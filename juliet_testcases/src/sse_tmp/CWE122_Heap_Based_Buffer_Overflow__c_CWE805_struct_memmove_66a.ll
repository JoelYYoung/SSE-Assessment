; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_66a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._twoIntsStruct = type { i32, i32 }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_66_bad() #0 !dbg !19 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataArray = alloca [5 x %struct._twoIntsStruct*], align 16
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !23, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata [5 x %struct._twoIntsStruct*]* %dataArray, metadata !25, metadata !DIExpression()), !dbg !29
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !31
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !32
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !33
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !34
  %arrayidx = getelementptr inbounds [5 x %struct._twoIntsStruct*], [5 x %struct._twoIntsStruct*]* %dataArray, i64 0, i64 2, !dbg !35
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %arrayidx, align 16, !dbg !36
  %arraydecay = getelementptr inbounds [5 x %struct._twoIntsStruct*], [5 x %struct._twoIntsStruct*]* %dataArray, i64 0, i64 0, !dbg !37
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_66b_badSink(%struct._twoIntsStruct** %arraydecay), !dbg !38
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_66b_badSink(%struct._twoIntsStruct**) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_66_good() #0 !dbg !40 {
entry:
  call void @goodG2B(), !dbg !41
  ret void, !dbg !42
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !43 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !49, metadata !DIExpression()), !dbg !50
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !51, metadata !DIExpression()), !dbg !52
  %call = call i64 @time(i64* null) #4, !dbg !53
  %conv = trunc i64 %call to i32, !dbg !54
  call void @srand(i32 %conv) #4, !dbg !55
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !56
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_66_good(), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !59
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_66_bad(), !dbg !60
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !61
  ret i32 0, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !63 {
entry:
  %data = alloca %struct._twoIntsStruct*, align 8
  %dataArray = alloca [5 x %struct._twoIntsStruct*], align 16
  call void @llvm.dbg.declare(metadata %struct._twoIntsStruct** %data, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata [5 x %struct._twoIntsStruct*]* %dataArray, metadata !66, metadata !DIExpression()), !dbg !67
  store %struct._twoIntsStruct* null, %struct._twoIntsStruct** %data, align 8, !dbg !68
  %call = call noalias align 16 i8* @malloc(i64 800) #4, !dbg !69
  %0 = bitcast i8* %call to %struct._twoIntsStruct*, !dbg !70
  store %struct._twoIntsStruct* %0, %struct._twoIntsStruct** %data, align 8, !dbg !71
  %1 = load %struct._twoIntsStruct*, %struct._twoIntsStruct** %data, align 8, !dbg !72
  %arrayidx = getelementptr inbounds [5 x %struct._twoIntsStruct*], [5 x %struct._twoIntsStruct*]* %dataArray, i64 0, i64 2, !dbg !73
  store %struct._twoIntsStruct* %1, %struct._twoIntsStruct** %arrayidx, align 16, !dbg !74
  %arraydecay = getelementptr inbounds [5 x %struct._twoIntsStruct*], [5 x %struct._twoIntsStruct*]* %dataArray, i64 0, i64 0, !dbg !75
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_66b_goodG2BSink(%struct._twoIntsStruct** %arraydecay), !dbg !76
  ret void, !dbg !77
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_66b_goodG2BSink(%struct._twoIntsStruct**) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!13, !14, !15, !16, !17}
!llvm.ident = !{!18}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_66a.c", directory: "/home/joelyang/SSE-Assessment")
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
!19 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_66_bad", scope: !20, file: !20, line: 24, type: !21, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!20 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_66a.c", directory: "/home/joelyang/SSE-Assessment")
!21 = !DISubroutineType(types: !22)
!22 = !{null}
!23 = !DILocalVariable(name: "data", scope: !19, file: !20, line: 26, type: !4)
!24 = !DILocation(line: 26, column: 21, scope: !19)
!25 = !DILocalVariable(name: "dataArray", scope: !19, file: !20, line: 27, type: !26)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 5)
!29 = !DILocation(line: 27, column: 21, scope: !19)
!30 = !DILocation(line: 28, column: 10, scope: !19)
!31 = !DILocation(line: 30, column: 29, scope: !19)
!32 = !DILocation(line: 30, column: 12, scope: !19)
!33 = !DILocation(line: 30, column: 10, scope: !19)
!34 = !DILocation(line: 32, column: 20, scope: !19)
!35 = !DILocation(line: 32, column: 5, scope: !19)
!36 = !DILocation(line: 32, column: 18, scope: !19)
!37 = !DILocation(line: 33, column: 76, scope: !19)
!38 = !DILocation(line: 33, column: 5, scope: !19)
!39 = !DILocation(line: 34, column: 1, scope: !19)
!40 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_struct_memmove_66_good", scope: !20, file: !20, line: 54, type: !21, scopeLine: 55, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!41 = !DILocation(line: 56, column: 5, scope: !40)
!42 = !DILocation(line: 57, column: 1, scope: !40)
!43 = distinct !DISubprogram(name: "main", scope: !20, file: !20, line: 69, type: !44, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!44 = !DISubroutineType(types: !45)
!45 = !{!10, !10, !46}
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !48, size: 64)
!48 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!49 = !DILocalVariable(name: "argc", arg: 1, scope: !43, file: !20, line: 69, type: !10)
!50 = !DILocation(line: 69, column: 14, scope: !43)
!51 = !DILocalVariable(name: "argv", arg: 2, scope: !43, file: !20, line: 69, type: !46)
!52 = !DILocation(line: 69, column: 27, scope: !43)
!53 = !DILocation(line: 72, column: 22, scope: !43)
!54 = !DILocation(line: 72, column: 12, scope: !43)
!55 = !DILocation(line: 72, column: 5, scope: !43)
!56 = !DILocation(line: 74, column: 5, scope: !43)
!57 = !DILocation(line: 75, column: 5, scope: !43)
!58 = !DILocation(line: 76, column: 5, scope: !43)
!59 = !DILocation(line: 79, column: 5, scope: !43)
!60 = !DILocation(line: 80, column: 5, scope: !43)
!61 = !DILocation(line: 81, column: 5, scope: !43)
!62 = !DILocation(line: 83, column: 5, scope: !43)
!63 = distinct !DISubprogram(name: "goodG2B", scope: !20, file: !20, line: 43, type: !21, scopeLine: 44, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocalVariable(name: "data", scope: !63, file: !20, line: 45, type: !4)
!65 = !DILocation(line: 45, column: 21, scope: !63)
!66 = !DILocalVariable(name: "dataArray", scope: !63, file: !20, line: 46, type: !26)
!67 = !DILocation(line: 46, column: 21, scope: !63)
!68 = !DILocation(line: 47, column: 10, scope: !63)
!69 = !DILocation(line: 49, column: 29, scope: !63)
!70 = !DILocation(line: 49, column: 12, scope: !63)
!71 = !DILocation(line: 49, column: 10, scope: !63)
!72 = !DILocation(line: 50, column: 20, scope: !63)
!73 = !DILocation(line: 50, column: 5, scope: !63)
!74 = !DILocation(line: 50, column: 18, scope: !63)
!75 = !DILocation(line: 51, column: 80, scope: !63)
!76 = !DILocation(line: 51, column: 5, scope: !63)
!77 = !DILocation(line: 52, column: 1, scope: !63)
