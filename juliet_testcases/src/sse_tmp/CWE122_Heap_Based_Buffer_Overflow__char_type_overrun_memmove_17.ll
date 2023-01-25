; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_17.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_17_bad() #0 !dbg !25 {
entry:
  %j = alloca i32, align 4
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata i32* %j, metadata !28, metadata !DIExpression()), !dbg !30
  store i32 0, i32* %j, align 4, !dbg !31
  br label %for.cond, !dbg !33

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %j, align 4, !dbg !34
  %cmp = icmp slt i32 %0, 1, !dbg !36
  br i1 %cmp, label %for.body, label %for.end, !dbg !37

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !38, metadata !DIExpression()), !dbg !41
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !42
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !43
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !41
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !44
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !46
  br i1 %cmp1, label %if.then, label %if.end, !dbg !47

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !48
  unreachable, !dbg !48

if.end:                                           ; preds = %for.body
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !50
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !51
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !52
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !53
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !54
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !54
  call void @printLine(i8* %5), !dbg !55
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !56
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !57
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !58
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !58
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !59
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !60
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 15, !dbg !59
  store i8 0, i8* %arrayidx, align 1, !dbg !61
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !62
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !63
  %arraydecay5 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 0, !dbg !62
  call void @printLine(i8* %arraydecay5), !dbg !64
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !65
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 1, !dbg !66
  %10 = load i8*, i8** %voidSecond6, align 8, !dbg !66
  call void @printLine(i8* %10), !dbg !67
  br label %for.inc, !dbg !68

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %j, align 4, !dbg !69
  %inc = add nsw i32 %11, 1, !dbg !69
  store i32 %inc, i32* %j, align 4, !dbg !69
  br label %for.cond, !dbg !70, !llvm.loop !71

for.end:                                          ; preds = %for.cond
  ret void, !dbg !74
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_17_good() #0 !dbg !75 {
entry:
  call void @good1(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !82, metadata !DIExpression()), !dbg !83
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !84, metadata !DIExpression()), !dbg !85
  %call = call i64 @time(i64* null) #6, !dbg !86
  %conv = trunc i64 %call to i32, !dbg !87
  call void @srand(i32 %conv) #6, !dbg !88
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_17_good(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_17_bad(), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !94
  ret i32 0, !dbg !95
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !96 {
entry:
  %k = alloca i32, align 4
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata i32* %k, metadata !97, metadata !DIExpression()), !dbg !98
  store i32 0, i32* %k, align 4, !dbg !99
  br label %for.cond, !dbg !101

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %k, align 4, !dbg !102
  %cmp = icmp slt i32 %0, 1, !dbg !104
  br i1 %cmp, label %for.body, label %for.end, !dbg !105

for.body:                                         ; preds = %for.cond
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !106, metadata !DIExpression()), !dbg !109
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !110
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !111
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !109
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !112
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !114
  br i1 %cmp1, label %if.then, label %if.end, !dbg !115

if.then:                                          ; preds = %for.body
  call void @exit(i32 -1) #7, !dbg !116
  unreachable, !dbg !116

if.end:                                           ; preds = %for.body
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !118
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !119
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !120
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !121
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !122
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !122
  call void @printLine(i8* %5), !dbg !123
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !124
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !125
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !126
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !126
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !127
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !128
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 15, !dbg !127
  store i8 0, i8* %arrayidx, align 1, !dbg !129
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !130
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !131
  %arraydecay5 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 0, !dbg !130
  call void @printLine(i8* %arraydecay5), !dbg !132
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !133
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 1, !dbg !134
  %10 = load i8*, i8** %voidSecond6, align 8, !dbg !134
  call void @printLine(i8* %10), !dbg !135
  br label %for.inc, !dbg !136

for.inc:                                          ; preds = %if.end
  %11 = load i32, i32* %k, align 4, !dbg !137
  %inc = add nsw i32 %11, 1, !dbg !137
  store i32 %inc, i32* %k, align 4, !dbg !137
  br label %for.cond, !dbg !138, !llvm.loop !139

for.end:                                          ; preds = %for.cond
  ret void, !dbg !141
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !15, !17, !18}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_17.c", directory: "/home/joelyang/SSE-Assessment")
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
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_17_bad", scope: !6, file: !6, line: 33, type: !26, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocalVariable(name: "j", scope: !25, file: !6, line: 35, type: !29)
!29 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!30 = !DILocation(line: 35, column: 9, scope: !25)
!31 = !DILocation(line: 36, column: 11, scope: !32)
!32 = distinct !DILexicalBlock(scope: !25, file: !6, line: 36, column: 5)
!33 = !DILocation(line: 36, column: 9, scope: !32)
!34 = !DILocation(line: 36, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !32, file: !6, line: 36, column: 5)
!36 = !DILocation(line: 36, column: 18, scope: !35)
!37 = !DILocation(line: 36, column: 5, scope: !32)
!38 = !DILocalVariable(name: "structCharVoid", scope: !39, file: !6, line: 39, type: !4)
!39 = distinct !DILexicalBlock(scope: !40, file: !6, line: 38, column: 9)
!40 = distinct !DILexicalBlock(scope: !35, file: !6, line: 37, column: 5)
!41 = !DILocation(line: 39, column: 24, scope: !39)
!42 = !DILocation(line: 39, column: 53, scope: !39)
!43 = !DILocation(line: 39, column: 41, scope: !39)
!44 = !DILocation(line: 40, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !6, line: 40, column: 17)
!46 = !DILocation(line: 40, column: 32, scope: !45)
!47 = !DILocation(line: 40, column: 17, scope: !39)
!48 = !DILocation(line: 40, column: 42, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !6, line: 40, column: 41)
!50 = !DILocation(line: 41, column: 13, scope: !39)
!51 = !DILocation(line: 41, column: 29, scope: !39)
!52 = !DILocation(line: 41, column: 40, scope: !39)
!53 = !DILocation(line: 43, column: 31, scope: !39)
!54 = !DILocation(line: 43, column: 47, scope: !39)
!55 = !DILocation(line: 43, column: 13, scope: !39)
!56 = !DILocation(line: 45, column: 21, scope: !39)
!57 = !DILocation(line: 45, column: 37, scope: !39)
!58 = !DILocation(line: 45, column: 13, scope: !39)
!59 = !DILocation(line: 46, column: 13, scope: !39)
!60 = !DILocation(line: 46, column: 29, scope: !39)
!61 = !DILocation(line: 46, column: 91, scope: !39)
!62 = !DILocation(line: 47, column: 31, scope: !39)
!63 = !DILocation(line: 47, column: 47, scope: !39)
!64 = !DILocation(line: 47, column: 13, scope: !39)
!65 = !DILocation(line: 48, column: 31, scope: !39)
!66 = !DILocation(line: 48, column: 47, scope: !39)
!67 = !DILocation(line: 48, column: 13, scope: !39)
!68 = !DILocation(line: 50, column: 5, scope: !40)
!69 = !DILocation(line: 36, column: 24, scope: !35)
!70 = !DILocation(line: 36, column: 5, scope: !35)
!71 = distinct !{!71, !37, !72, !73}
!72 = !DILocation(line: 50, column: 5, scope: !32)
!73 = !{!"llvm.loop.mustprogress"}
!74 = !DILocation(line: 51, column: 1, scope: !25)
!75 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memmove_17_good", scope: !6, file: !6, line: 78, type: !26, scopeLine: 79, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DILocation(line: 80, column: 5, scope: !75)
!77 = !DILocation(line: 81, column: 1, scope: !75)
!78 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 92, type: !79, scopeLine: 93, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!29, !29, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!82 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !6, line: 92, type: !29)
!83 = !DILocation(line: 92, column: 14, scope: !78)
!84 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !6, line: 92, type: !81)
!85 = !DILocation(line: 92, column: 27, scope: !78)
!86 = !DILocation(line: 95, column: 22, scope: !78)
!87 = !DILocation(line: 95, column: 12, scope: !78)
!88 = !DILocation(line: 95, column: 5, scope: !78)
!89 = !DILocation(line: 97, column: 5, scope: !78)
!90 = !DILocation(line: 98, column: 5, scope: !78)
!91 = !DILocation(line: 99, column: 5, scope: !78)
!92 = !DILocation(line: 102, column: 5, scope: !78)
!93 = !DILocation(line: 103, column: 5, scope: !78)
!94 = !DILocation(line: 104, column: 5, scope: !78)
!95 = !DILocation(line: 106, column: 5, scope: !78)
!96 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 58, type: !26, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!97 = !DILocalVariable(name: "k", scope: !96, file: !6, line: 60, type: !29)
!98 = !DILocation(line: 60, column: 9, scope: !96)
!99 = !DILocation(line: 61, column: 11, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !6, line: 61, column: 5)
!101 = !DILocation(line: 61, column: 9, scope: !100)
!102 = !DILocation(line: 61, column: 16, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !6, line: 61, column: 5)
!104 = !DILocation(line: 61, column: 18, scope: !103)
!105 = !DILocation(line: 61, column: 5, scope: !100)
!106 = !DILocalVariable(name: "structCharVoid", scope: !107, file: !6, line: 64, type: !4)
!107 = distinct !DILexicalBlock(scope: !108, file: !6, line: 63, column: 9)
!108 = distinct !DILexicalBlock(scope: !103, file: !6, line: 62, column: 5)
!109 = !DILocation(line: 64, column: 24, scope: !107)
!110 = !DILocation(line: 64, column: 53, scope: !107)
!111 = !DILocation(line: 64, column: 41, scope: !107)
!112 = !DILocation(line: 65, column: 17, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !6, line: 65, column: 17)
!114 = !DILocation(line: 65, column: 32, scope: !113)
!115 = !DILocation(line: 65, column: 17, scope: !107)
!116 = !DILocation(line: 65, column: 42, scope: !117)
!117 = distinct !DILexicalBlock(scope: !113, file: !6, line: 65, column: 41)
!118 = !DILocation(line: 66, column: 13, scope: !107)
!119 = !DILocation(line: 66, column: 29, scope: !107)
!120 = !DILocation(line: 66, column: 40, scope: !107)
!121 = !DILocation(line: 68, column: 31, scope: !107)
!122 = !DILocation(line: 68, column: 47, scope: !107)
!123 = !DILocation(line: 68, column: 13, scope: !107)
!124 = !DILocation(line: 70, column: 21, scope: !107)
!125 = !DILocation(line: 70, column: 37, scope: !107)
!126 = !DILocation(line: 70, column: 13, scope: !107)
!127 = !DILocation(line: 71, column: 13, scope: !107)
!128 = !DILocation(line: 71, column: 29, scope: !107)
!129 = !DILocation(line: 71, column: 91, scope: !107)
!130 = !DILocation(line: 72, column: 31, scope: !107)
!131 = !DILocation(line: 72, column: 47, scope: !107)
!132 = !DILocation(line: 72, column: 13, scope: !107)
!133 = !DILocation(line: 73, column: 31, scope: !107)
!134 = !DILocation(line: 73, column: 47, scope: !107)
!135 = !DILocation(line: 73, column: 13, scope: !107)
!136 = !DILocation(line: 75, column: 5, scope: !108)
!137 = !DILocation(line: 61, column: 24, scope: !103)
!138 = !DILocation(line: 61, column: 5, scope: !103)
!139 = distinct !{!139, !105, !140, !73}
!140 = !DILocation(line: 75, column: 5, scope: !100)
!141 = !DILocation(line: 76, column: 1, scope: !96)
