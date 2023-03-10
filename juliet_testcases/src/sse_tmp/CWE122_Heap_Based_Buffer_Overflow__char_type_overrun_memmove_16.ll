; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_16.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_16.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_16_bad() #0 !dbg !25 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  br label %while.body, !dbg !28

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !29, metadata !DIExpression()), !dbg !32
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !33
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !34
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !32
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !35
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #7, !dbg !39
  unreachable, !dbg !39

if.end:                                           ; preds = %while.body
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !41
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !42
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !43
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !44
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !45
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !45
  call void @printLine(i8* %4), !dbg !46
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !47
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !48
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !49
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !49
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !50
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !51
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !50
  store i8 0, i8* %arrayidx, align 1, !dbg !52
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !53
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !54
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !53
  call void @printLine(i8* %arraydecay4), !dbg !55
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !56
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !57
  %9 = load i8*, i8** %voidSecond5, align 8, !dbg !57
  call void @printLine(i8* %9), !dbg !58
  br label %while.end, !dbg !59

while.end:                                        ; preds = %if.end
  ret void, !dbg !60
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_16_good() #0 !dbg !61 {
entry:
  call void @good1(), !dbg !62
  ret void, !dbg !63
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !64 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !69, metadata !DIExpression()), !dbg !70
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !71, metadata !DIExpression()), !dbg !72
  %call = call i64 @time(i64* null) #6, !dbg !73
  %conv = trunc i64 %call to i32, !dbg !74
  call void @srand(i32 %conv) #6, !dbg !75
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_16_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_16_bad(), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !81
  ret i32 0, !dbg !82
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !83 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  br label %while.body, !dbg !84

while.body:                                       ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !85, metadata !DIExpression()), !dbg !88
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !89
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !90
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !88
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !91
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !93
  br i1 %cmp, label %if.then, label %if.end, !dbg !94

if.then:                                          ; preds = %while.body
  call void @exit(i32 -1) #7, !dbg !95
  unreachable, !dbg !95

if.end:                                           ; preds = %while.body
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !97
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !98
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !99
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !100
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !101
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !101
  call void @printLine(i8* %4), !dbg !102
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !103
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !104
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !105
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !105
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !106
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !107
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !106
  store i8 0, i8* %arrayidx, align 1, !dbg !108
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !109
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !110
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !109
  call void @printLine(i8* %arraydecay4), !dbg !111
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !112
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !113
  %9 = load i8*, i8** %voidSecond5, align 8, !dbg !113
  call void @printLine(i8* %9), !dbg !114
  br label %while.end, !dbg !115

while.end:                                        ; preds = %if.end
  ret void, !dbg !116
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_16.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !15, !17, !18}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_16.c", directory: "/home/joelyang/SSE-Assessment")
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
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_16_bad", scope: !6, file: !6, line: 33, type: !26, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocation(line: 35, column: 5, scope: !25)
!29 = !DILocalVariable(name: "structCharVoid", scope: !30, file: !6, line: 38, type: !4)
!30 = distinct !DILexicalBlock(scope: !31, file: !6, line: 37, column: 9)
!31 = distinct !DILexicalBlock(scope: !25, file: !6, line: 36, column: 5)
!32 = !DILocation(line: 38, column: 24, scope: !30)
!33 = !DILocation(line: 38, column: 53, scope: !30)
!34 = !DILocation(line: 38, column: 41, scope: !30)
!35 = !DILocation(line: 39, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !30, file: !6, line: 39, column: 17)
!37 = !DILocation(line: 39, column: 32, scope: !36)
!38 = !DILocation(line: 39, column: 17, scope: !30)
!39 = !DILocation(line: 39, column: 42, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !6, line: 39, column: 41)
!41 = !DILocation(line: 40, column: 13, scope: !30)
!42 = !DILocation(line: 40, column: 29, scope: !30)
!43 = !DILocation(line: 40, column: 40, scope: !30)
!44 = !DILocation(line: 42, column: 31, scope: !30)
!45 = !DILocation(line: 42, column: 47, scope: !30)
!46 = !DILocation(line: 42, column: 13, scope: !30)
!47 = !DILocation(line: 44, column: 21, scope: !30)
!48 = !DILocation(line: 44, column: 37, scope: !30)
!49 = !DILocation(line: 44, column: 13, scope: !30)
!50 = !DILocation(line: 45, column: 13, scope: !30)
!51 = !DILocation(line: 45, column: 29, scope: !30)
!52 = !DILocation(line: 45, column: 91, scope: !30)
!53 = !DILocation(line: 46, column: 31, scope: !30)
!54 = !DILocation(line: 46, column: 47, scope: !30)
!55 = !DILocation(line: 46, column: 13, scope: !30)
!56 = !DILocation(line: 47, column: 31, scope: !30)
!57 = !DILocation(line: 47, column: 47, scope: !30)
!58 = !DILocation(line: 47, column: 13, scope: !30)
!59 = !DILocation(line: 49, column: 9, scope: !31)
!60 = !DILocation(line: 51, column: 1, scope: !25)
!61 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_16_good", scope: !6, file: !6, line: 78, type: !26, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!62 = !DILocation(line: 80, column: 5, scope: !61)
!63 = !DILocation(line: 81, column: 1, scope: !61)
!64 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 92, type: !65, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !67, !68}
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !6, line: 92, type: !67)
!70 = !DILocation(line: 92, column: 14, scope: !64)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !6, line: 92, type: !68)
!72 = !DILocation(line: 92, column: 27, scope: !64)
!73 = !DILocation(line: 95, column: 22, scope: !64)
!74 = !DILocation(line: 95, column: 12, scope: !64)
!75 = !DILocation(line: 95, column: 5, scope: !64)
!76 = !DILocation(line: 97, column: 5, scope: !64)
!77 = !DILocation(line: 98, column: 5, scope: !64)
!78 = !DILocation(line: 99, column: 5, scope: !64)
!79 = !DILocation(line: 102, column: 5, scope: !64)
!80 = !DILocation(line: 103, column: 5, scope: !64)
!81 = !DILocation(line: 104, column: 5, scope: !64)
!82 = !DILocation(line: 106, column: 5, scope: !64)
!83 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 58, type: !26, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocation(line: 60, column: 5, scope: !83)
!85 = !DILocalVariable(name: "structCharVoid", scope: !86, file: !6, line: 63, type: !4)
!86 = distinct !DILexicalBlock(scope: !87, file: !6, line: 62, column: 9)
!87 = distinct !DILexicalBlock(scope: !83, file: !6, line: 61, column: 5)
!88 = !DILocation(line: 63, column: 24, scope: !86)
!89 = !DILocation(line: 63, column: 53, scope: !86)
!90 = !DILocation(line: 63, column: 41, scope: !86)
!91 = !DILocation(line: 64, column: 17, scope: !92)
!92 = distinct !DILexicalBlock(scope: !86, file: !6, line: 64, column: 17)
!93 = !DILocation(line: 64, column: 32, scope: !92)
!94 = !DILocation(line: 64, column: 17, scope: !86)
!95 = !DILocation(line: 64, column: 42, scope: !96)
!96 = distinct !DILexicalBlock(scope: !92, file: !6, line: 64, column: 41)
!97 = !DILocation(line: 65, column: 13, scope: !86)
!98 = !DILocation(line: 65, column: 29, scope: !86)
!99 = !DILocation(line: 65, column: 40, scope: !86)
!100 = !DILocation(line: 67, column: 31, scope: !86)
!101 = !DILocation(line: 67, column: 47, scope: !86)
!102 = !DILocation(line: 67, column: 13, scope: !86)
!103 = !DILocation(line: 69, column: 21, scope: !86)
!104 = !DILocation(line: 69, column: 37, scope: !86)
!105 = !DILocation(line: 69, column: 13, scope: !86)
!106 = !DILocation(line: 70, column: 13, scope: !86)
!107 = !DILocation(line: 70, column: 29, scope: !86)
!108 = !DILocation(line: 70, column: 91, scope: !86)
!109 = !DILocation(line: 71, column: 31, scope: !86)
!110 = !DILocation(line: 71, column: 47, scope: !86)
!111 = !DILocation(line: 71, column: 13, scope: !86)
!112 = !DILocation(line: 72, column: 31, scope: !86)
!113 = !DILocation(line: 72, column: 47, scope: !86)
!114 = !DILocation(line: 72, column: 13, scope: !86)
!115 = !DILocation(line: 74, column: 9, scope: !87)
!116 = !DILocation(line: 76, column: 1, scope: !83)
