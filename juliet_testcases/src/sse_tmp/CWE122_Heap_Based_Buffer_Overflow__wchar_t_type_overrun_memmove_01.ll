; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_01_bad() #0 !dbg !27 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !30, metadata !DIExpression()), !dbg !32
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !33
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !34
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !32
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !35
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %entry
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !41
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !42
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !43
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !44
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !45
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !45
  %5 = bitcast i8* %4 to i32*, !dbg !46
  call void @printWLine(i32* %5), !dbg !47
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !48
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !49
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !50
  %7 = bitcast i32* %arraydecay to i8*, !dbg !50
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !50
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !51
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !52
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !51
  store i32 0, i32* %arrayidx, align 4, !dbg !53
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !54
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !55
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !54
  call void @printWLine(i32* %arraydecay4), !dbg !56
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !57
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 1, !dbg !58
  %11 = load i8*, i8** %voidSecond5, align 8, !dbg !58
  %12 = bitcast i8* %11 to i32*, !dbg !59
  call void @printWLine(i32* %12), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_01_good() #0 !dbg !62 {
entry:
  call void @good1(), !dbg !63
  ret void, !dbg !64
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !65 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !71, metadata !DIExpression()), !dbg !72
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !73, metadata !DIExpression()), !dbg !74
  %call = call i64 @time(i64* null) #6, !dbg !75
  %conv = trunc i64 %call to i32, !dbg !76
  call void @srand(i32 %conv) #6, !dbg !77
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !78
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_01_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_01_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !85 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !86, metadata !DIExpression()), !dbg !88
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !89
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !90
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !88
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !91
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %entry
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !97
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !98
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !99
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !100
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !101
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !101
  %5 = bitcast i8* %4 to i32*, !dbg !102
  call void @printWLine(i32* %5), !dbg !103
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !104
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !105
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !106
  %7 = bitcast i32* %arraydecay to i8*, !dbg !106
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !106
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !107
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !108
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !107
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !110
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !111
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !110
  call void @printWLine(i32* %arraydecay4), !dbg !112
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !113
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 1, !dbg !114
  %11 = load i8*, i8** %voidSecond5, align 8, !dbg !114
  %12 = bitcast i8* %11 to i32*, !dbg !115
  call void @printWLine(i32* %12), !dbg !116
  ret void, !dbg !117
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!21, !22, !23, !24, !25}
!llvm.ident = !{!26}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !17, !19, !20}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_01.c", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !6, line: 24, size: 640, elements: !8)
!8 = !{!9, !16, !18}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !7, file: !6, line: 26, baseType: !10, size: 512)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 512, elements: !14)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !12, line: 74, baseType: !13)
!12 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{!15}
!15 = !DISubrange(count: 16)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !7, file: !6, line: 27, baseType: !17, size: 64, offset: 512)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !7, file: !6, line: 28, baseType: !17, size: 64, offset: 576)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!20 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!21 = !{i32 7, !"Dwarf Version", i32 4}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{i32 1, !"wchar_size", i32 4}
!24 = !{i32 7, !"uwtable", i32 1}
!25 = !{i32 7, !"frame-pointer", i32 2}
!26 = !{!"clang version 13.0.0"}
!27 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_01_bad", scope: !6, file: !6, line: 33, type: !28, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{null}
!30 = !DILocalVariable(name: "structCharVoid", scope: !31, file: !6, line: 36, type: !4)
!31 = distinct !DILexicalBlock(scope: !27, file: !6, line: 35, column: 5)
!32 = !DILocation(line: 36, column: 20, scope: !31)
!33 = !DILocation(line: 36, column: 49, scope: !31)
!34 = !DILocation(line: 36, column: 37, scope: !31)
!35 = !DILocation(line: 37, column: 13, scope: !36)
!36 = distinct !DILexicalBlock(scope: !31, file: !6, line: 37, column: 13)
!37 = !DILocation(line: 37, column: 28, scope: !36)
!38 = !DILocation(line: 37, column: 13, scope: !31)
!39 = !DILocation(line: 37, column: 38, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !6, line: 37, column: 37)
!41 = !DILocation(line: 38, column: 9, scope: !31)
!42 = !DILocation(line: 38, column: 25, scope: !31)
!43 = !DILocation(line: 38, column: 36, scope: !31)
!44 = !DILocation(line: 40, column: 31, scope: !31)
!45 = !DILocation(line: 40, column: 47, scope: !31)
!46 = !DILocation(line: 40, column: 20, scope: !31)
!47 = !DILocation(line: 40, column: 9, scope: !31)
!48 = !DILocation(line: 42, column: 17, scope: !31)
!49 = !DILocation(line: 42, column: 33, scope: !31)
!50 = !DILocation(line: 42, column: 9, scope: !31)
!51 = !DILocation(line: 43, column: 9, scope: !31)
!52 = !DILocation(line: 43, column: 25, scope: !31)
!53 = !DILocation(line: 43, column: 90, scope: !31)
!54 = !DILocation(line: 44, column: 31, scope: !31)
!55 = !DILocation(line: 44, column: 47, scope: !31)
!56 = !DILocation(line: 44, column: 9, scope: !31)
!57 = !DILocation(line: 45, column: 31, scope: !31)
!58 = !DILocation(line: 45, column: 47, scope: !31)
!59 = !DILocation(line: 45, column: 20, scope: !31)
!60 = !DILocation(line: 45, column: 9, scope: !31)
!61 = !DILocation(line: 47, column: 1, scope: !27)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_01_good", scope: !6, file: !6, line: 69, type: !28, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 71, column: 5, scope: !62)
!64 = !DILocation(line: 72, column: 1, scope: !62)
!65 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 83, type: !66, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!66 = !DISubroutineType(types: !67)
!67 = !{!13, !13, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !6, line: 83, type: !13)
!72 = !DILocation(line: 83, column: 14, scope: !65)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !6, line: 83, type: !68)
!74 = !DILocation(line: 83, column: 27, scope: !65)
!75 = !DILocation(line: 86, column: 22, scope: !65)
!76 = !DILocation(line: 86, column: 12, scope: !65)
!77 = !DILocation(line: 86, column: 5, scope: !65)
!78 = !DILocation(line: 88, column: 5, scope: !65)
!79 = !DILocation(line: 89, column: 5, scope: !65)
!80 = !DILocation(line: 90, column: 5, scope: !65)
!81 = !DILocation(line: 93, column: 5, scope: !65)
!82 = !DILocation(line: 94, column: 5, scope: !65)
!83 = !DILocation(line: 95, column: 5, scope: !65)
!84 = !DILocation(line: 97, column: 5, scope: !65)
!85 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 53, type: !28, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "structCharVoid", scope: !87, file: !6, line: 56, type: !4)
!87 = distinct !DILexicalBlock(scope: !85, file: !6, line: 55, column: 5)
!88 = !DILocation(line: 56, column: 20, scope: !87)
!89 = !DILocation(line: 56, column: 49, scope: !87)
!90 = !DILocation(line: 56, column: 37, scope: !87)
!91 = !DILocation(line: 57, column: 13, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !6, line: 57, column: 13)
!93 = !DILocation(line: 57, column: 28, scope: !92)
!94 = !DILocation(line: 57, column: 13, scope: !87)
!95 = !DILocation(line: 57, column: 38, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !6, line: 57, column: 37)
!97 = !DILocation(line: 58, column: 9, scope: !87)
!98 = !DILocation(line: 58, column: 25, scope: !87)
!99 = !DILocation(line: 58, column: 36, scope: !87)
!100 = !DILocation(line: 60, column: 31, scope: !87)
!101 = !DILocation(line: 60, column: 47, scope: !87)
!102 = !DILocation(line: 60, column: 20, scope: !87)
!103 = !DILocation(line: 60, column: 9, scope: !87)
!104 = !DILocation(line: 62, column: 17, scope: !87)
!105 = !DILocation(line: 62, column: 33, scope: !87)
!106 = !DILocation(line: 62, column: 9, scope: !87)
!107 = !DILocation(line: 63, column: 9, scope: !87)
!108 = !DILocation(line: 63, column: 25, scope: !87)
!109 = !DILocation(line: 63, column: 90, scope: !87)
!110 = !DILocation(line: 64, column: 31, scope: !87)
!111 = !DILocation(line: 64, column: 47, scope: !87)
!112 = !DILocation(line: 64, column: 9, scope: !87)
!113 = !DILocation(line: 65, column: 31, scope: !87)
!114 = !DILocation(line: 65, column: 47, scope: !87)
!115 = !DILocation(line: 65, column: 20, scope: !87)
!116 = !DILocation(line: 65, column: 9, scope: !87)
!117 = !DILocation(line: 67, column: 1, scope: !85)
