; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_01.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_01_bad() #0 !dbg !25 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !28, metadata !DIExpression()), !dbg !30
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !31
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !32
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !30
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !33
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !35
  br i1 %cmp, label %if.then, label %if.end, !dbg !36

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !37
  unreachable, !dbg !37

if.end:                                           ; preds = %entry
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !39
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !40
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !41
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !42
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !43
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !43
  call void @printLine(i8* %4), !dbg !44
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !45
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !46
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !47
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !47
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !48
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !49
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !48
  store i8 0, i8* %arrayidx, align 1, !dbg !50
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !51
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !52
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !51
  call void @printLine(i8* %arraydecay4), !dbg !53
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !54
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !55
  %9 = load i8*, i8** %voidSecond5, align 8, !dbg !55
  call void @printLine(i8* %9), !dbg !56
  ret void, !dbg !57
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memmove.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1 immarg) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_01_good() #0 !dbg !58 {
entry:
  call void @good1(), !dbg !59
  ret void, !dbg !60
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !61 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !66, metadata !DIExpression()), !dbg !67
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !68, metadata !DIExpression()), !dbg !69
  %call = call i64 @time(i64* null) #6, !dbg !70
  %conv = trunc i64 %call to i32, !dbg !71
  call void @srand(i32 %conv) #6, !dbg !72
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !73
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_01_good(), !dbg !74
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_01_bad(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !78
  ret i32 0, !dbg !79
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !80 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !81, metadata !DIExpression()), !dbg !83
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !84
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !85
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !83
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !86
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !88
  br i1 %cmp, label %if.then, label %if.end, !dbg !89

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !90
  unreachable, !dbg !90

if.end:                                           ; preds = %entry
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !92
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !93
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !94
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !95
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !96
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !96
  call void @printLine(i8* %4), !dbg !97
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !98
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !99
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !100
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !100
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !101
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !102
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !101
  store i8 0, i8* %arrayidx, align 1, !dbg !103
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !104
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !105
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !104
  call void @printLine(i8* %arraydecay4), !dbg !106
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !107
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !108
  %9 = load i8*, i8** %voidSecond5, align 8, !dbg !108
  call void @printLine(i8* %9), !dbg !109
  ret void, !dbg !110
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_01.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !15, !17, !18}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_01.c", directory: "/home/joelyang/SSE-Assessment")
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
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_01_bad", scope: !6, file: !6, line: 33, type: !26, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocalVariable(name: "structCharVoid", scope: !29, file: !6, line: 36, type: !4)
!29 = distinct !DILexicalBlock(scope: !25, file: !6, line: 35, column: 5)
!30 = !DILocation(line: 36, column: 20, scope: !29)
!31 = !DILocation(line: 36, column: 49, scope: !29)
!32 = !DILocation(line: 36, column: 37, scope: !29)
!33 = !DILocation(line: 37, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !29, file: !6, line: 37, column: 13)
!35 = !DILocation(line: 37, column: 28, scope: !34)
!36 = !DILocation(line: 37, column: 13, scope: !29)
!37 = !DILocation(line: 37, column: 38, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !6, line: 37, column: 37)
!39 = !DILocation(line: 38, column: 9, scope: !29)
!40 = !DILocation(line: 38, column: 25, scope: !29)
!41 = !DILocation(line: 38, column: 36, scope: !29)
!42 = !DILocation(line: 40, column: 27, scope: !29)
!43 = !DILocation(line: 40, column: 43, scope: !29)
!44 = !DILocation(line: 40, column: 9, scope: !29)
!45 = !DILocation(line: 42, column: 17, scope: !29)
!46 = !DILocation(line: 42, column: 33, scope: !29)
!47 = !DILocation(line: 42, column: 9, scope: !29)
!48 = !DILocation(line: 43, column: 9, scope: !29)
!49 = !DILocation(line: 43, column: 25, scope: !29)
!50 = !DILocation(line: 43, column: 87, scope: !29)
!51 = !DILocation(line: 44, column: 27, scope: !29)
!52 = !DILocation(line: 44, column: 43, scope: !29)
!53 = !DILocation(line: 44, column: 9, scope: !29)
!54 = !DILocation(line: 45, column: 27, scope: !29)
!55 = !DILocation(line: 45, column: 43, scope: !29)
!56 = !DILocation(line: 45, column: 9, scope: !29)
!57 = !DILocation(line: 47, column: 1, scope: !25)
!58 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_01_good", scope: !6, file: !6, line: 69, type: !26, scopeLine: 70, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 71, column: 5, scope: !58)
!60 = !DILocation(line: 72, column: 1, scope: !58)
!61 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 83, type: !62, scopeLine: 84, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{!64, !64, !65}
!64 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!66 = !DILocalVariable(name: "argc", arg: 1, scope: !61, file: !6, line: 83, type: !64)
!67 = !DILocation(line: 83, column: 14, scope: !61)
!68 = !DILocalVariable(name: "argv", arg: 2, scope: !61, file: !6, line: 83, type: !65)
!69 = !DILocation(line: 83, column: 27, scope: !61)
!70 = !DILocation(line: 86, column: 22, scope: !61)
!71 = !DILocation(line: 86, column: 12, scope: !61)
!72 = !DILocation(line: 86, column: 5, scope: !61)
!73 = !DILocation(line: 88, column: 5, scope: !61)
!74 = !DILocation(line: 89, column: 5, scope: !61)
!75 = !DILocation(line: 90, column: 5, scope: !61)
!76 = !DILocation(line: 93, column: 5, scope: !61)
!77 = !DILocation(line: 94, column: 5, scope: !61)
!78 = !DILocation(line: 95, column: 5, scope: !61)
!79 = !DILocation(line: 97, column: 5, scope: !61)
!80 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 53, type: !26, scopeLine: 54, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!81 = !DILocalVariable(name: "structCharVoid", scope: !82, file: !6, line: 56, type: !4)
!82 = distinct !DILexicalBlock(scope: !80, file: !6, line: 55, column: 5)
!83 = !DILocation(line: 56, column: 20, scope: !82)
!84 = !DILocation(line: 56, column: 49, scope: !82)
!85 = !DILocation(line: 56, column: 37, scope: !82)
!86 = !DILocation(line: 57, column: 13, scope: !87)
!87 = distinct !DILexicalBlock(scope: !82, file: !6, line: 57, column: 13)
!88 = !DILocation(line: 57, column: 28, scope: !87)
!89 = !DILocation(line: 57, column: 13, scope: !82)
!90 = !DILocation(line: 57, column: 38, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !6, line: 57, column: 37)
!92 = !DILocation(line: 58, column: 9, scope: !82)
!93 = !DILocation(line: 58, column: 25, scope: !82)
!94 = !DILocation(line: 58, column: 36, scope: !82)
!95 = !DILocation(line: 60, column: 27, scope: !82)
!96 = !DILocation(line: 60, column: 43, scope: !82)
!97 = !DILocation(line: 60, column: 9, scope: !82)
!98 = !DILocation(line: 62, column: 17, scope: !82)
!99 = !DILocation(line: 62, column: 33, scope: !82)
!100 = !DILocation(line: 62, column: 9, scope: !82)
!101 = !DILocation(line: 63, column: 9, scope: !82)
!102 = !DILocation(line: 63, column: 25, scope: !82)
!103 = !DILocation(line: 63, column: 87, scope: !82)
!104 = !DILocation(line: 64, column: 27, scope: !82)
!105 = !DILocation(line: 64, column: 43, scope: !82)
!106 = !DILocation(line: 64, column: 9, scope: !82)
!107 = !DILocation(line: 65, column: 27, scope: !82)
!108 = !DILocation(line: 65, column: 43, scope: !82)
!109 = !DILocation(line: 65, column: 9, scope: !82)
!110 = !DILocation(line: 67, column: 1, scope: !80)
