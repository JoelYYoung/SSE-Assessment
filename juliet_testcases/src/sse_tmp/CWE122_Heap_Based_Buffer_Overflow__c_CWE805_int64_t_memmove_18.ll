; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_18_bad() #0 !dbg !18 {
entry:
  %data = alloca i64*, align 8
  %source1 = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !22, metadata !DIExpression()), !dbg !23
  store i64* null, i64** %data, align 8, !dbg !24
  br label %source, !dbg !25

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !26), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 400) #7, !dbg !28
  %0 = bitcast i8* %call to i64*, !dbg !29
  store i64* %0, i64** %data, align 8, !dbg !30
  %1 = load i64*, i64** %data, align 8, !dbg !31
  %cmp = icmp eq i64* %1, null, !dbg !33
  br i1 %cmp, label %if.then, label %if.end, !dbg !34

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #8, !dbg !35
  unreachable, !dbg !35

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata [100 x i64]* %source1, metadata !37, metadata !DIExpression()), !dbg !42
  %2 = bitcast [100 x i64]* %source1 to i8*, !dbg !42
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !42
  %3 = load i64*, i64** %data, align 8, !dbg !43
  %4 = bitcast i64* %3 to i8*, !dbg !44
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source1, i64 0, i64 0, !dbg !44
  %5 = bitcast i64* %arraydecay to i8*, !dbg !44
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %4, i8* align 16 %5, i64 800, i1 false), !dbg !44
  %6 = load i64*, i64** %data, align 8, !dbg !45
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 0, !dbg !45
  %7 = load i64, i64* %arrayidx, align 8, !dbg !45
  call void @printLongLongLine(i64 %7), !dbg !46
  %8 = load i64*, i64** %data, align 8, !dbg !47
  %9 = bitcast i64* %8 to i8*, !dbg !47
  call void @free(i8* %9) #7, !dbg !48
  ret void, !dbg !49
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

declare dso_local void @printLongLongLine(i64) #6

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_18_good() #0 !dbg !50 {
entry:
  call void @goodG2B(), !dbg !51
  ret void, !dbg !52
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !53 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !62, metadata !DIExpression()), !dbg !63
  %call = call i64 @time(i64* null) #7, !dbg !64
  %conv = trunc i64 %call to i32, !dbg !65
  call void @srand(i32 %conv) #7, !dbg !66
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !67
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_18_good(), !dbg !68
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !69
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !70
  call void @CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_18_bad(), !dbg !71
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !72
  ret i32 0, !dbg !73
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !74 {
entry:
  %data = alloca i64*, align 8
  %source1 = alloca [100 x i64], align 16
  call void @llvm.dbg.declare(metadata i64** %data, metadata !75, metadata !DIExpression()), !dbg !76
  store i64* null, i64** %data, align 8, !dbg !77
  br label %source, !dbg !78

source:                                           ; preds = %entry
  call void @llvm.dbg.label(metadata !79), !dbg !80
  %call = call noalias align 16 i8* @malloc(i64 800) #7, !dbg !81
  %0 = bitcast i8* %call to i64*, !dbg !82
  store i64* %0, i64** %data, align 8, !dbg !83
  %1 = load i64*, i64** %data, align 8, !dbg !84
  %cmp = icmp eq i64* %1, null, !dbg !86
  br i1 %cmp, label %if.then, label %if.end, !dbg !87

if.then:                                          ; preds = %source
  call void @exit(i32 -1) #8, !dbg !88
  unreachable, !dbg !88

if.end:                                           ; preds = %source
  call void @llvm.dbg.declare(metadata [100 x i64]* %source1, metadata !90, metadata !DIExpression()), !dbg !92
  %2 = bitcast [100 x i64]* %source1 to i8*, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %2, i8 0, i64 800, i1 false), !dbg !92
  %3 = load i64*, i64** %data, align 8, !dbg !93
  %4 = bitcast i64* %3 to i8*, !dbg !94
  %arraydecay = getelementptr inbounds [100 x i64], [100 x i64]* %source1, i64 0, i64 0, !dbg !94
  %5 = bitcast i64* %arraydecay to i8*, !dbg !94
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %4, i8* align 16 %5, i64 800, i1 false), !dbg !94
  %6 = load i64*, i64** %data, align 8, !dbg !95
  %arrayidx = getelementptr inbounds i64, i64* %6, i64 0, !dbg !95
  %7 = load i64, i64* %arrayidx, align 8, !dbg !95
  call void @printLongLongLine(i64 %7), !dbg !96
  %8 = load i64*, i64** %data, align 8, !dbg !97
  %9 = bitcast i64* %8 to i8*, !dbg !97
  call void @free(i8* %9) #7, !dbg !98
  ret void, !dbg !99
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn writeonly }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!12, !13, !14, !15, !16}
!llvm.ident = !{!17}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_18.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !10, !11}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !6, line: 27, baseType: !7)
!6 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/stdint-intn.h", directory: "")
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !8, line: 44, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "")
!9 = !DIBasicType(name: "long int", size: 64, encoding: DW_ATE_signed)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{i32 7, !"Dwarf Version", i32 4}
!13 = !{i32 2, !"Debug Info Version", i32 3}
!14 = !{i32 1, !"wchar_size", i32 4}
!15 = !{i32 7, !"uwtable", i32 1}
!16 = !{i32 7, !"frame-pointer", i32 2}
!17 = !{!"clang version 13.0.0"}
!18 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_18_bad", scope: !19, file: !19, line: 21, type: !20, scopeLine: 22, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_18.c", directory: "/home/joelyang/SSE-Assessment")
!20 = !DISubroutineType(types: !21)
!21 = !{null}
!22 = !DILocalVariable(name: "data", scope: !18, file: !19, line: 23, type: !4)
!23 = !DILocation(line: 23, column: 15, scope: !18)
!24 = !DILocation(line: 24, column: 10, scope: !18)
!25 = !DILocation(line: 25, column: 5, scope: !18)
!26 = !DILabel(scope: !18, name: "source", file: !19, line: 26)
!27 = !DILocation(line: 26, column: 1, scope: !18)
!28 = !DILocation(line: 28, column: 23, scope: !18)
!29 = !DILocation(line: 28, column: 12, scope: !18)
!30 = !DILocation(line: 28, column: 10, scope: !18)
!31 = !DILocation(line: 29, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !18, file: !19, line: 29, column: 9)
!33 = !DILocation(line: 29, column: 14, scope: !32)
!34 = !DILocation(line: 29, column: 9, scope: !18)
!35 = !DILocation(line: 29, column: 24, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !19, line: 29, column: 23)
!37 = !DILocalVariable(name: "source", scope: !38, file: !19, line: 31, type: !39)
!38 = distinct !DILexicalBlock(scope: !18, file: !19, line: 30, column: 5)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 6400, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 100)
!42 = !DILocation(line: 31, column: 17, scope: !38)
!43 = !DILocation(line: 33, column: 17, scope: !38)
!44 = !DILocation(line: 33, column: 9, scope: !38)
!45 = !DILocation(line: 34, column: 27, scope: !38)
!46 = !DILocation(line: 34, column: 9, scope: !38)
!47 = !DILocation(line: 35, column: 14, scope: !38)
!48 = !DILocation(line: 35, column: 9, scope: !38)
!49 = !DILocation(line: 37, column: 1, scope: !18)
!50 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__c_CWE805_int64_t_memmove_18_good", scope: !19, file: !19, line: 62, type: !20, scopeLine: 63, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!51 = !DILocation(line: 64, column: 5, scope: !50)
!52 = !DILocation(line: 65, column: 1, scope: !50)
!53 = distinct !DISubprogram(name: "main", scope: !19, file: !19, line: 77, type: !54, scopeLine: 78, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!54 = !DISubroutineType(types: !55)
!55 = !{!56, !56, !57}
!56 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!57 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !53, file: !19, line: 77, type: !56)
!61 = !DILocation(line: 77, column: 14, scope: !53)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !53, file: !19, line: 77, type: !57)
!63 = !DILocation(line: 77, column: 27, scope: !53)
!64 = !DILocation(line: 80, column: 22, scope: !53)
!65 = !DILocation(line: 80, column: 12, scope: !53)
!66 = !DILocation(line: 80, column: 5, scope: !53)
!67 = !DILocation(line: 82, column: 5, scope: !53)
!68 = !DILocation(line: 83, column: 5, scope: !53)
!69 = !DILocation(line: 84, column: 5, scope: !53)
!70 = !DILocation(line: 87, column: 5, scope: !53)
!71 = !DILocation(line: 88, column: 5, scope: !53)
!72 = !DILocation(line: 89, column: 5, scope: !53)
!73 = !DILocation(line: 91, column: 5, scope: !53)
!74 = distinct !DISubprogram(name: "goodG2B", scope: !19, file: !19, line: 44, type: !20, scopeLine: 45, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocalVariable(name: "data", scope: !74, file: !19, line: 46, type: !4)
!76 = !DILocation(line: 46, column: 15, scope: !74)
!77 = !DILocation(line: 47, column: 10, scope: !74)
!78 = !DILocation(line: 48, column: 5, scope: !74)
!79 = !DILabel(scope: !74, name: "source", file: !19, line: 49)
!80 = !DILocation(line: 49, column: 1, scope: !74)
!81 = !DILocation(line: 51, column: 23, scope: !74)
!82 = !DILocation(line: 51, column: 12, scope: !74)
!83 = !DILocation(line: 51, column: 10, scope: !74)
!84 = !DILocation(line: 52, column: 9, scope: !85)
!85 = distinct !DILexicalBlock(scope: !74, file: !19, line: 52, column: 9)
!86 = !DILocation(line: 52, column: 14, scope: !85)
!87 = !DILocation(line: 52, column: 9, scope: !74)
!88 = !DILocation(line: 52, column: 24, scope: !89)
!89 = distinct !DILexicalBlock(scope: !85, file: !19, line: 52, column: 23)
!90 = !DILocalVariable(name: "source", scope: !91, file: !19, line: 54, type: !39)
!91 = distinct !DILexicalBlock(scope: !74, file: !19, line: 53, column: 5)
!92 = !DILocation(line: 54, column: 17, scope: !91)
!93 = !DILocation(line: 56, column: 17, scope: !91)
!94 = !DILocation(line: 56, column: 9, scope: !91)
!95 = !DILocation(line: 57, column: 27, scope: !91)
!96 = !DILocation(line: 57, column: 9, scope: !91)
!97 = !DILocation(line: 58, column: 14, scope: !91)
!98 = !DILocation(line: 58, column: 9, scope: !91)
!99 = !DILocation(line: 60, column: 1, scope: !74)
