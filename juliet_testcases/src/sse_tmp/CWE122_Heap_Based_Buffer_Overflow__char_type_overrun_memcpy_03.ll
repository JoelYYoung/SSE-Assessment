; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_03.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_03_bad() #0 !dbg !25 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !28, metadata !DIExpression()), !dbg !32
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !33
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
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !43
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !44
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !45
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !45
  call void @printLine(i8* %4), !dbg !46
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !47
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !48
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !49
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !49
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
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !59
  %11 = bitcast %struct._charVoid* %10 to i8*, !dbg !59
  call void @free(i8* %11) #6, !dbg !60
  ret void, !dbg !61
}

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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_03_good() #0 !dbg !62 {
entry:
  call void @good1(), !dbg !63
  call void @good2(), !dbg !64
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
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_03_good(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !80
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_03_bad(), !dbg !82
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
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !86, metadata !DIExpression()), !dbg !90
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !91
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !92
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !90
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !93
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !95
  br i1 %cmp, label %if.then, label %if.end, !dbg !96

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !97
  unreachable, !dbg !97

if.end:                                           ; preds = %entry
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !99
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !100
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !101
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !102
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !103
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !103
  call void @printLine(i8* %4), !dbg !104
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !105
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !106
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !107
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !107
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !108
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !109
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !108
  store i8 0, i8* %arrayidx, align 1, !dbg !110
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !111
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !112
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !111
  call void @printLine(i8* %arraydecay4), !dbg !113
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !114
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !115
  %9 = load i8*, i8** %voidSecond5, align 8, !dbg !115
  call void @printLine(i8* %9), !dbg !116
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !117
  %11 = bitcast %struct._charVoid* %10 to i8*, !dbg !117
  call void @free(i8* %11) #6, !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !120 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !121, metadata !DIExpression()), !dbg !125
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !126
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !127
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !125
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !128
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !130
  br i1 %cmp, label %if.then, label %if.end, !dbg !131

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !132
  unreachable, !dbg !132

if.end:                                           ; preds = %entry
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !134
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !135
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !136
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !137
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !138
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !138
  call void @printLine(i8* %4), !dbg !139
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !140
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !141
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !142
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !142
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !143
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !144
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !143
  store i8 0, i8* %arrayidx, align 1, !dbg !145
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !146
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !147
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !146
  call void @printLine(i8* %arraydecay4), !dbg !148
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !149
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !150
  %9 = load i8*, i8** %voidSecond5, align 8, !dbg !150
  call void @printLine(i8* %9), !dbg !151
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !152
  %11 = bitcast %struct._charVoid* %10 to i8*, !dbg !152
  call void @free(i8* %11) #6, !dbg !153
  ret void, !dbg !154
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_03.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !15, !17, !18}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_03.c", directory: "/root/SSE-Assessment")
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
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_03_bad", scope: !6, file: !6, line: 33, type: !26, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocalVariable(name: "structCharVoid", scope: !29, file: !6, line: 38, type: !4)
!29 = distinct !DILexicalBlock(scope: !30, file: !6, line: 37, column: 9)
!30 = distinct !DILexicalBlock(scope: !31, file: !6, line: 36, column: 5)
!31 = distinct !DILexicalBlock(scope: !25, file: !6, line: 35, column: 8)
!32 = !DILocation(line: 38, column: 24, scope: !29)
!33 = !DILocation(line: 38, column: 53, scope: !29)
!34 = !DILocation(line: 38, column: 41, scope: !29)
!35 = !DILocation(line: 39, column: 17, scope: !36)
!36 = distinct !DILexicalBlock(scope: !29, file: !6, line: 39, column: 17)
!37 = !DILocation(line: 39, column: 32, scope: !36)
!38 = !DILocation(line: 39, column: 17, scope: !29)
!39 = !DILocation(line: 39, column: 42, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !6, line: 39, column: 41)
!41 = !DILocation(line: 40, column: 13, scope: !29)
!42 = !DILocation(line: 40, column: 29, scope: !29)
!43 = !DILocation(line: 40, column: 40, scope: !29)
!44 = !DILocation(line: 42, column: 31, scope: !29)
!45 = !DILocation(line: 42, column: 47, scope: !29)
!46 = !DILocation(line: 42, column: 13, scope: !29)
!47 = !DILocation(line: 44, column: 20, scope: !29)
!48 = !DILocation(line: 44, column: 36, scope: !29)
!49 = !DILocation(line: 44, column: 13, scope: !29)
!50 = !DILocation(line: 45, column: 13, scope: !29)
!51 = !DILocation(line: 45, column: 29, scope: !29)
!52 = !DILocation(line: 45, column: 91, scope: !29)
!53 = !DILocation(line: 46, column: 31, scope: !29)
!54 = !DILocation(line: 46, column: 47, scope: !29)
!55 = !DILocation(line: 46, column: 13, scope: !29)
!56 = !DILocation(line: 47, column: 31, scope: !29)
!57 = !DILocation(line: 47, column: 47, scope: !29)
!58 = !DILocation(line: 47, column: 13, scope: !29)
!59 = !DILocation(line: 48, column: 18, scope: !29)
!60 = !DILocation(line: 48, column: 13, scope: !29)
!61 = !DILocation(line: 51, column: 1, scope: !25)
!62 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_03_good", scope: !6, file: !6, line: 104, type: !26, scopeLine: 105, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DILocation(line: 106, column: 5, scope: !62)
!64 = !DILocation(line: 107, column: 5, scope: !62)
!65 = !DILocation(line: 108, column: 1, scope: !62)
!66 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 119, type: !67, scopeLine: 120, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!67 = !DISubroutineType(types: !68)
!68 = !{!69, !69, !70}
!69 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!70 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !66, file: !6, line: 119, type: !69)
!72 = !DILocation(line: 119, column: 14, scope: !66)
!73 = !DILocalVariable(name: "argv", arg: 2, scope: !66, file: !6, line: 119, type: !70)
!74 = !DILocation(line: 119, column: 27, scope: !66)
!75 = !DILocation(line: 122, column: 22, scope: !66)
!76 = !DILocation(line: 122, column: 12, scope: !66)
!77 = !DILocation(line: 122, column: 5, scope: !66)
!78 = !DILocation(line: 124, column: 5, scope: !66)
!79 = !DILocation(line: 125, column: 5, scope: !66)
!80 = !DILocation(line: 126, column: 5, scope: !66)
!81 = !DILocation(line: 129, column: 5, scope: !66)
!82 = !DILocation(line: 130, column: 5, scope: !66)
!83 = !DILocation(line: 131, column: 5, scope: !66)
!84 = !DILocation(line: 133, column: 5, scope: !66)
!85 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 58, type: !26, scopeLine: 59, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "structCharVoid", scope: !87, file: !6, line: 68, type: !4)
!87 = distinct !DILexicalBlock(scope: !88, file: !6, line: 67, column: 9)
!88 = distinct !DILexicalBlock(scope: !89, file: !6, line: 66, column: 5)
!89 = distinct !DILexicalBlock(scope: !85, file: !6, line: 60, column: 8)
!90 = !DILocation(line: 68, column: 24, scope: !87)
!91 = !DILocation(line: 68, column: 53, scope: !87)
!92 = !DILocation(line: 68, column: 41, scope: !87)
!93 = !DILocation(line: 69, column: 17, scope: !94)
!94 = distinct !DILexicalBlock(scope: !87, file: !6, line: 69, column: 17)
!95 = !DILocation(line: 69, column: 32, scope: !94)
!96 = !DILocation(line: 69, column: 17, scope: !87)
!97 = !DILocation(line: 69, column: 42, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !6, line: 69, column: 41)
!99 = !DILocation(line: 70, column: 13, scope: !87)
!100 = !DILocation(line: 70, column: 29, scope: !87)
!101 = !DILocation(line: 70, column: 40, scope: !87)
!102 = !DILocation(line: 72, column: 31, scope: !87)
!103 = !DILocation(line: 72, column: 47, scope: !87)
!104 = !DILocation(line: 72, column: 13, scope: !87)
!105 = !DILocation(line: 74, column: 20, scope: !87)
!106 = !DILocation(line: 74, column: 36, scope: !87)
!107 = !DILocation(line: 74, column: 13, scope: !87)
!108 = !DILocation(line: 75, column: 13, scope: !87)
!109 = !DILocation(line: 75, column: 29, scope: !87)
!110 = !DILocation(line: 75, column: 91, scope: !87)
!111 = !DILocation(line: 76, column: 31, scope: !87)
!112 = !DILocation(line: 76, column: 47, scope: !87)
!113 = !DILocation(line: 76, column: 13, scope: !87)
!114 = !DILocation(line: 77, column: 31, scope: !87)
!115 = !DILocation(line: 77, column: 47, scope: !87)
!116 = !DILocation(line: 77, column: 13, scope: !87)
!117 = !DILocation(line: 78, column: 18, scope: !87)
!118 = !DILocation(line: 78, column: 13, scope: !87)
!119 = !DILocation(line: 81, column: 1, scope: !85)
!120 = distinct !DISubprogram(name: "good2", scope: !6, file: !6, line: 84, type: !26, scopeLine: 85, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!121 = !DILocalVariable(name: "structCharVoid", scope: !122, file: !6, line: 89, type: !4)
!122 = distinct !DILexicalBlock(scope: !123, file: !6, line: 88, column: 9)
!123 = distinct !DILexicalBlock(scope: !124, file: !6, line: 87, column: 5)
!124 = distinct !DILexicalBlock(scope: !120, file: !6, line: 86, column: 8)
!125 = !DILocation(line: 89, column: 24, scope: !122)
!126 = !DILocation(line: 89, column: 53, scope: !122)
!127 = !DILocation(line: 89, column: 41, scope: !122)
!128 = !DILocation(line: 90, column: 17, scope: !129)
!129 = distinct !DILexicalBlock(scope: !122, file: !6, line: 90, column: 17)
!130 = !DILocation(line: 90, column: 32, scope: !129)
!131 = !DILocation(line: 90, column: 17, scope: !122)
!132 = !DILocation(line: 90, column: 42, scope: !133)
!133 = distinct !DILexicalBlock(scope: !129, file: !6, line: 90, column: 41)
!134 = !DILocation(line: 91, column: 13, scope: !122)
!135 = !DILocation(line: 91, column: 29, scope: !122)
!136 = !DILocation(line: 91, column: 40, scope: !122)
!137 = !DILocation(line: 93, column: 31, scope: !122)
!138 = !DILocation(line: 93, column: 47, scope: !122)
!139 = !DILocation(line: 93, column: 13, scope: !122)
!140 = !DILocation(line: 95, column: 20, scope: !122)
!141 = !DILocation(line: 95, column: 36, scope: !122)
!142 = !DILocation(line: 95, column: 13, scope: !122)
!143 = !DILocation(line: 96, column: 13, scope: !122)
!144 = !DILocation(line: 96, column: 29, scope: !122)
!145 = !DILocation(line: 96, column: 91, scope: !122)
!146 = !DILocation(line: 97, column: 31, scope: !122)
!147 = !DILocation(line: 97, column: 47, scope: !122)
!148 = !DILocation(line: 97, column: 13, scope: !122)
!149 = !DILocation(line: 98, column: 31, scope: !122)
!150 = !DILocation(line: 98, column: 47, scope: !122)
!151 = !DILocation(line: 98, column: 13, scope: !122)
!152 = !DILocation(line: 99, column: 18, scope: !122)
!153 = !DILocation(line: 99, column: 13, scope: !122)
!154 = !DILocation(line: 102, column: 1, scope: !120)
