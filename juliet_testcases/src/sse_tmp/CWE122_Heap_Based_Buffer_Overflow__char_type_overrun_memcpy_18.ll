; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_18.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_18.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_18_bad() #0 !dbg !25 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  br label %sink, !dbg !28

sink:                                             ; preds = %entry
  call void @llvm.dbg.label(metadata !29), !dbg !30
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !31, metadata !DIExpression()), !dbg !33
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !34
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !35
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !33
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !36
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !38
  br i1 %cmp, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %sink
  call void @exit(i32 -1) #7, !dbg !40
  unreachable, !dbg !40

if.end:                                           ; preds = %sink
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !42
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !43
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !44
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !45
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !46
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !46
  call void @printLine(i8* %4), !dbg !47
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !48
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !49
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !50
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !50
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !51
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !52
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !51
  store i8 0, i8* %arrayidx, align 1, !dbg !53
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !54
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !55
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !54
  call void @printLine(i8* %arraydecay4), !dbg !56
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !57
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !58
  %9 = load i8*, i8** %voidSecond5, align 8, !dbg !58
  call void @printLine(i8* %9), !dbg !59
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !60
  %11 = bitcast %struct._charVoid* %10 to i8*, !dbg !60
  call void @free(i8* %11) #6, !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_18_good() #0 !dbg !63 {
entry:
  call void @good1(), !dbg !64
  ret void, !dbg !65
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !66 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_18_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_18_bad(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !83
  ret i32 0, !dbg !84
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !85 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  br label %sink, !dbg !86

sink:                                             ; preds = %entry
  call void @llvm.dbg.label(metadata !87), !dbg !88
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !89, metadata !DIExpression()), !dbg !91
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !92
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !93
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !91
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !94
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !96
  br i1 %cmp, label %if.then, label %if.end, !dbg !97

if.then:                                          ; preds = %sink
  call void @exit(i32 -1) #7, !dbg !98
  unreachable, !dbg !98

if.end:                                           ; preds = %sink
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !100
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !101
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !102
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !103
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !104
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !104
  call void @printLine(i8* %4), !dbg !105
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !106
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !107
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !108
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !108
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !109
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !110
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !109
  store i8 0, i8* %arrayidx, align 1, !dbg !111
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !112
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !113
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !112
  call void @printLine(i8* %arraydecay4), !dbg !114
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !115
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !116
  %9 = load i8*, i8** %voidSecond5, align 8, !dbg !116
  call void @printLine(i8* %9), !dbg !117
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !118
  %11 = bitcast %struct._charVoid* %10 to i8*, !dbg !118
  call void @free(i8* %11) #6, !dbg !119
  ret void, !dbg !120
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
!llvm.module.flags = !{!19, !20, !21, !22, !23}
!llvm.ident = !{!24}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_18.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !15, !17, !18}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_18.c", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !6, line: 24, size: 256, elements: !8)
!8 = !{!9, !14, !16}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !7, file: !6, line: 26, baseType: !10, size: 128)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 128, elements: !12)
!11 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!12 = !{!13}
!13 = !DISubrange(count: 16)
!14 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !7, file: !6, line: 27, baseType: !15, size: 64, offset: 128)
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !7, file: !6, line: 28, baseType: !15, size: 64, offset: 192)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!18 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!19 = !{i32 7, !"Dwarf Version", i32 4}
!20 = !{i32 2, !"Debug Info Version", i32 3}
!21 = !{i32 1, !"wchar_size", i32 4}
!22 = !{i32 7, !"uwtable", i32 1}
!23 = !{i32 7, !"frame-pointer", i32 2}
!24 = !{!"clang version 13.0.0"}
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_18_bad", scope: !6, file: !6, line: 33, type: !26, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocation(line: 35, column: 5, scope: !25)
!29 = !DILabel(scope: !25, name: "sink", file: !6, line: 36)
!30 = !DILocation(line: 36, column: 1, scope: !25)
!31 = !DILocalVariable(name: "structCharVoid", scope: !32, file: !6, line: 38, type: !4)
!32 = distinct !DILexicalBlock(scope: !25, file: !6, line: 37, column: 5)
!33 = !DILocation(line: 38, column: 20, scope: !32)
!34 = !DILocation(line: 38, column: 49, scope: !32)
!35 = !DILocation(line: 38, column: 37, scope: !32)
!36 = !DILocation(line: 39, column: 13, scope: !37)
!37 = distinct !DILexicalBlock(scope: !32, file: !6, line: 39, column: 13)
!38 = !DILocation(line: 39, column: 28, scope: !37)
!39 = !DILocation(line: 39, column: 13, scope: !32)
!40 = !DILocation(line: 39, column: 38, scope: !41)
!41 = distinct !DILexicalBlock(scope: !37, file: !6, line: 39, column: 37)
!42 = !DILocation(line: 40, column: 9, scope: !32)
!43 = !DILocation(line: 40, column: 25, scope: !32)
!44 = !DILocation(line: 40, column: 36, scope: !32)
!45 = !DILocation(line: 42, column: 27, scope: !32)
!46 = !DILocation(line: 42, column: 43, scope: !32)
!47 = !DILocation(line: 42, column: 9, scope: !32)
!48 = !DILocation(line: 44, column: 16, scope: !32)
!49 = !DILocation(line: 44, column: 32, scope: !32)
!50 = !DILocation(line: 44, column: 9, scope: !32)
!51 = !DILocation(line: 45, column: 9, scope: !32)
!52 = !DILocation(line: 45, column: 25, scope: !32)
!53 = !DILocation(line: 45, column: 87, scope: !32)
!54 = !DILocation(line: 46, column: 27, scope: !32)
!55 = !DILocation(line: 46, column: 43, scope: !32)
!56 = !DILocation(line: 46, column: 9, scope: !32)
!57 = !DILocation(line: 47, column: 27, scope: !32)
!58 = !DILocation(line: 47, column: 43, scope: !32)
!59 = !DILocation(line: 47, column: 9, scope: !32)
!60 = !DILocation(line: 48, column: 14, scope: !32)
!61 = !DILocation(line: 48, column: 9, scope: !32)
!62 = !DILocation(line: 50, column: 1, scope: !25)
!63 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_18_good", scope: !6, file: !6, line: 76, type: !26, scopeLine: 77, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DILocation(line: 78, column: 5, scope: !63)
!65 = !DILocation(line: 79, column: 1, scope: !63)
!66 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 90, type: !67, scopeLine: 91, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!69, !69, !70}
!69 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !6, line: 90, type: !69)
!72 = !DILocation(line: 90, column: 14, scope: !66)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !6, line: 90, type: !70)
!74 = !DILocation(line: 90, column: 27, scope: !66)
!75 = !DILocation(line: 93, column: 22, scope: !66)
!76 = !DILocation(line: 93, column: 12, scope: !66)
!77 = !DILocation(line: 93, column: 5, scope: !66)
!78 = !DILocation(line: 95, column: 5, scope: !66)
!79 = !DILocation(line: 96, column: 5, scope: !66)
!80 = !DILocation(line: 97, column: 5, scope: !66)
!81 = !DILocation(line: 100, column: 5, scope: !66)
!82 = !DILocation(line: 101, column: 5, scope: !66)
!83 = !DILocation(line: 102, column: 5, scope: !66)
!84 = !DILocation(line: 104, column: 5, scope: !66)
!85 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 57, type: !26, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocation(line: 59, column: 5, scope: !85)
!87 = !DILabel(scope: !85, name: "sink", file: !6, line: 60)
!88 = !DILocation(line: 60, column: 1, scope: !85)
!89 = !DILocalVariable(name: "structCharVoid", scope: !90, file: !6, line: 62, type: !4)
!90 = distinct !DILexicalBlock(scope: !85, file: !6, line: 61, column: 5)
!91 = !DILocation(line: 62, column: 20, scope: !90)
!92 = !DILocation(line: 62, column: 49, scope: !90)
!93 = !DILocation(line: 62, column: 37, scope: !90)
!94 = !DILocation(line: 63, column: 13, scope: !95)
!95 = distinct !DILexicalBlock(scope: !90, file: !6, line: 63, column: 13)
!96 = !DILocation(line: 63, column: 28, scope: !95)
!97 = !DILocation(line: 63, column: 13, scope: !90)
!98 = !DILocation(line: 63, column: 38, scope: !99)
!99 = distinct !DILexicalBlock(scope: !95, file: !6, line: 63, column: 37)
!100 = !DILocation(line: 64, column: 9, scope: !90)
!101 = !DILocation(line: 64, column: 25, scope: !90)
!102 = !DILocation(line: 64, column: 36, scope: !90)
!103 = !DILocation(line: 66, column: 27, scope: !90)
!104 = !DILocation(line: 66, column: 43, scope: !90)
!105 = !DILocation(line: 66, column: 9, scope: !90)
!106 = !DILocation(line: 68, column: 16, scope: !90)
!107 = !DILocation(line: 68, column: 32, scope: !90)
!108 = !DILocation(line: 68, column: 9, scope: !90)
!109 = !DILocation(line: 69, column: 9, scope: !90)
!110 = !DILocation(line: 69, column: 25, scope: !90)
!111 = !DILocation(line: 69, column: 87, scope: !90)
!112 = !DILocation(line: 70, column: 27, scope: !90)
!113 = !DILocation(line: 70, column: 43, scope: !90)
!114 = !DILocation(line: 70, column: 9, scope: !90)
!115 = !DILocation(line: 71, column: 27, scope: !90)
!116 = !DILocation(line: 71, column: 43, scope: !90)
!117 = !DILocation(line: 71, column: 9, scope: !90)
!118 = !DILocation(line: 72, column: 14, scope: !90)
!119 = !DILocation(line: 72, column: 9, scope: !90)
!120 = !DILocation(line: 74, column: 1, scope: !85)
