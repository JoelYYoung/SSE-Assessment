; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_66a.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_66a.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_66_bad() #0 !dbg !17 {
entry:
  %data = alloca i64*, align 8
  %dataArray = alloca [5 x i64*], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !21, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata [5 x i64*]* %dataArray, metadata !23, metadata !DIExpression()), !dbg !27
  store i64* null, i64** %data, align 8, !dbg !28
  %call = call noalias align 16 i8* @malloc(i64 400) #4, !dbg !29
  %0 = bitcast i8* %call to i64*, !dbg !30
  store i64* %0, i64** %data, align 8, !dbg !31
  %1 = load i64*, i64** %data, align 8, !dbg !32
  %arrayidx = getelementptr inbounds [5 x i64*], [5 x i64*]* %dataArray, i64 0, i64 2, !dbg !33
  store i64* %1, i64** %arrayidx, align 16, !dbg !34
  %arraydecay = getelementptr inbounds [5 x i64*], [5 x i64*]* %dataArray, i64 0, i64 0, !dbg !35
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_66b_badSink(i64** %arraydecay), !dbg !36
  ret void, !dbg !37
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_66b_badSink(i64**) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_66_good() #0 !dbg !38 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !48, metadata !DIExpression()), !dbg !49
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !50, metadata !DIExpression()), !dbg !51
  %call = call i64 @time(i64* null) #4, !dbg !52
  %conv = trunc i64 %call to i32, !dbg !53
  call void @srand(i32 %conv) #4, !dbg !54
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !55
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_66_good(), !dbg !56
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !57
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !58
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_66_bad(), !dbg !59
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !60
  ret i32 0, !dbg !61
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !62 {
entry:
  %data = alloca i64*, align 8
  %dataArray = alloca [5 x i64*], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata [5 x i64*]* %dataArray, metadata !65, metadata !DIExpression()), !dbg !66
  store i64* null, i64** %data, align 8, !dbg !67
  %call = call noalias align 16 i8* @malloc(i64 800) #4, !dbg !68
  %0 = bitcast i8* %call to i64*, !dbg !69
  store i64* %0, i64** %data, align 8, !dbg !70
  %1 = load i64*, i64** %data, align 8, !dbg !71
  %arrayidx = getelementptr inbounds [5 x i64*], [5 x i64*]* %dataArray, i64 0, i64 2, !dbg !72
  store i64* %1, i64** %arrayidx, align 16, !dbg !73
  %arraydecay = getelementptr inbounds [5 x i64*], [5 x i64*]* %dataArray, i64 0, i64 0, !dbg !74
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_66b_goodG2BSink(i64** %arraydecay), !dbg !75
  ret void, !dbg !76
}

declare dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_66b_goodG2BSink(i64**) #3

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_66a.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"uwtable", i32 1}
!15 = !{i32 7, !"frame-pointer", i32 2}
!16 = !{!"clang version 13.0.0"}
!17 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_66_bad", scope: !18, file: !18, line: 24, type: !19, scopeLine: 25, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!18 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_66a.c", directory: "/home/joelyang/SSE-Assessment")
!19 = !DISubroutineType(types: !20)
!20 = !{null}
!21 = !DILocalVariable(name: "data", scope: !17, file: !18, line: 26, type: !4)
!22 = !DILocation(line: 26, column: 15, scope: !17)
!23 = !DILocalVariable(name: "dataArray", scope: !17, file: !18, line: 27, type: !24)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 320, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 5)
!27 = !DILocation(line: 27, column: 15, scope: !17)
!28 = !DILocation(line: 28, column: 10, scope: !17)
!29 = !DILocation(line: 30, column: 23, scope: !17)
!30 = !DILocation(line: 30, column: 12, scope: !17)
!31 = !DILocation(line: 30, column: 10, scope: !17)
!32 = !DILocation(line: 32, column: 20, scope: !17)
!33 = !DILocation(line: 32, column: 5, scope: !17)
!34 = !DILocation(line: 32, column: 18, scope: !17)
!35 = !DILocation(line: 33, column: 76, scope: !17)
!36 = !DILocation(line: 33, column: 5, scope: !17)
!37 = !DILocation(line: 34, column: 1, scope: !17)
!38 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memcpy_66_good", scope: !18, file: !18, line: 54, type: !19, scopeLine: 55, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!39 = !DILocation(line: 56, column: 5, scope: !38)
!40 = !DILocation(line: 57, column: 1, scope: !38)
!41 = distinct !DISubprogram(name: "main", scope: !18, file: !18, line: 69, type: !42, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!42 = !DISubroutineType(types: !43)
!43 = !{!44, !44, !45}
!44 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!45 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !46, size: 64)
!46 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!47 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!48 = !DILocalVariable(name: "argc", arg: 1, scope: !41, file: !18, line: 69, type: !44)
!49 = !DILocation(line: 69, column: 14, scope: !41)
!50 = !DILocalVariable(name: "argv", arg: 2, scope: !41, file: !18, line: 69, type: !45)
!51 = !DILocation(line: 69, column: 27, scope: !41)
!52 = !DILocation(line: 72, column: 22, scope: !41)
!53 = !DILocation(line: 72, column: 12, scope: !41)
!54 = !DILocation(line: 72, column: 5, scope: !41)
!55 = !DILocation(line: 74, column: 5, scope: !41)
!56 = !DILocation(line: 75, column: 5, scope: !41)
!57 = !DILocation(line: 76, column: 5, scope: !41)
!58 = !DILocation(line: 79, column: 5, scope: !41)
!59 = !DILocation(line: 80, column: 5, scope: !41)
!60 = !DILocation(line: 81, column: 5, scope: !41)
!61 = !DILocation(line: 83, column: 5, scope: !41)
!62 = distinct !DISubprogram(name: "goodG2B", scope: !18, file: !18, line: 43, type: !19, scopeLine: 44, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocalVariable(name: "data", scope: !62, file: !18, line: 45, type: !4)
!64 = !DILocation(line: 45, column: 15, scope: !62)
!65 = !DILocalVariable(name: "dataArray", scope: !62, file: !18, line: 46, type: !24)
!66 = !DILocation(line: 46, column: 15, scope: !62)
!67 = !DILocation(line: 47, column: 10, scope: !62)
!68 = !DILocation(line: 49, column: 23, scope: !62)
!69 = !DILocation(line: 49, column: 12, scope: !62)
!70 = !DILocation(line: 49, column: 10, scope: !62)
!71 = !DILocation(line: 50, column: 20, scope: !62)
!72 = !DILocation(line: 50, column: 5, scope: !62)
!73 = !DILocation(line: 50, column: 18, scope: !62)
!74 = !DILocation(line: 51, column: 80, scope: !62)
!75 = !DILocation(line: 51, column: 5, scope: !62)
!76 = !DILocation(line: 52, column: 1, scope: !62)
