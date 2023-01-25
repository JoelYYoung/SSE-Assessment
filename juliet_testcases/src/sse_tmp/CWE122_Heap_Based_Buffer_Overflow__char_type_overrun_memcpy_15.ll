; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_15.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_15.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_15_bad() #0 !dbg !25 {
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
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !47
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
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !57
  %11 = bitcast %struct._charVoid* %10 to i8*, !dbg !57
  call void @free(i8* %11) #6, !dbg !58
  ret void, !dbg !59
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_15_good() #0 !dbg !60 {
entry:
  call void @good1(), !dbg !61
  call void @good2(), !dbg !62
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
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_15_good(), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_15_bad(), !dbg !80
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
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !84, metadata !DIExpression()), !dbg !86
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !87
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !88
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !86
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !89
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !91
  br i1 %cmp, label %if.then, label %if.end, !dbg !92

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !93
  unreachable, !dbg !93

if.end:                                           ; preds = %entry
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !95
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !96
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !97
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !98
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !99
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !99
  call void @printLine(i8* %4), !dbg !100
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !101
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !102
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !103
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !103
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !104
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !105
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !104
  store i8 0, i8* %arrayidx, align 1, !dbg !106
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !107
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !108
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !107
  call void @printLine(i8* %arraydecay4), !dbg !109
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !110
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !111
  %9 = load i8*, i8** %voidSecond5, align 8, !dbg !111
  call void @printLine(i8* %9), !dbg !112
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !113
  %11 = bitcast %struct._charVoid* %10 to i8*, !dbg !113
  call void @free(i8* %11) #6, !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !116 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !117, metadata !DIExpression()), !dbg !119
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !120
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !121
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !119
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !122
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !124
  br i1 %cmp, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !126
  unreachable, !dbg !126

if.end:                                           ; preds = %entry
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !128
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !129
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !130
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !131
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !132
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !132
  call void @printLine(i8* %4), !dbg !133
  %5 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !134
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %5, i32 0, i32 0, !dbg !135
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !136
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !136
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !137
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !138
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst2, i64 0, i64 15, !dbg !137
  store i8 0, i8* %arrayidx, align 1, !dbg !139
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !140
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !141
  %arraydecay4 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 0, !dbg !140
  call void @printLine(i8* %arraydecay4), !dbg !142
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !143
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 1, !dbg !144
  %9 = load i8*, i8** %voidSecond5, align 8, !dbg !144
  call void @printLine(i8* %9), !dbg !145
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !146
  %11 = bitcast %struct._charVoid* %10 to i8*, !dbg !146
  call void @free(i8* %11) #6, !dbg !147
  ret void, !dbg !148
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !15, !17, !18}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_15.c", directory: "/home/joelyang/SSE-Assessment")
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
!25 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_15_bad", scope: !6, file: !6, line: 33, type: !26, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!26 = !DISubroutineType(types: !27)
!27 = !{null}
!28 = !DILocalVariable(name: "structCharVoid", scope: !29, file: !6, line: 39, type: !4)
!29 = distinct !DILexicalBlock(scope: !25, file: !6, line: 38, column: 5)
!30 = !DILocation(line: 39, column: 20, scope: !29)
!31 = !DILocation(line: 39, column: 49, scope: !29)
!32 = !DILocation(line: 39, column: 37, scope: !29)
!33 = !DILocation(line: 40, column: 13, scope: !34)
!34 = distinct !DILexicalBlock(scope: !29, file: !6, line: 40, column: 13)
!35 = !DILocation(line: 40, column: 28, scope: !34)
!36 = !DILocation(line: 40, column: 13, scope: !29)
!37 = !DILocation(line: 40, column: 38, scope: !38)
!38 = distinct !DILexicalBlock(scope: !34, file: !6, line: 40, column: 37)
!39 = !DILocation(line: 41, column: 9, scope: !29)
!40 = !DILocation(line: 41, column: 25, scope: !29)
!41 = !DILocation(line: 41, column: 36, scope: !29)
!42 = !DILocation(line: 43, column: 27, scope: !29)
!43 = !DILocation(line: 43, column: 43, scope: !29)
!44 = !DILocation(line: 43, column: 9, scope: !29)
!45 = !DILocation(line: 45, column: 16, scope: !29)
!46 = !DILocation(line: 45, column: 32, scope: !29)
!47 = !DILocation(line: 45, column: 9, scope: !29)
!48 = !DILocation(line: 46, column: 9, scope: !29)
!49 = !DILocation(line: 46, column: 25, scope: !29)
!50 = !DILocation(line: 46, column: 87, scope: !29)
!51 = !DILocation(line: 47, column: 27, scope: !29)
!52 = !DILocation(line: 47, column: 43, scope: !29)
!53 = !DILocation(line: 47, column: 9, scope: !29)
!54 = !DILocation(line: 48, column: 27, scope: !29)
!55 = !DILocation(line: 48, column: 43, scope: !29)
!56 = !DILocation(line: 48, column: 9, scope: !29)
!57 = !DILocation(line: 49, column: 14, scope: !29)
!58 = !DILocation(line: 49, column: 9, scope: !29)
!59 = !DILocation(line: 57, column: 1, scope: !25)
!60 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_15_good", scope: !6, file: !6, line: 117, type: !26, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!61 = !DILocation(line: 119, column: 5, scope: !60)
!62 = !DILocation(line: 120, column: 5, scope: !60)
!63 = !DILocation(line: 121, column: 1, scope: !60)
!64 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 132, type: !65, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DISubroutineType(types: !66)
!66 = !{!67, !67, !68}
!67 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!69 = !DILocalVariable(name: "argc", arg: 1, scope: !64, file: !6, line: 132, type: !67)
!70 = !DILocation(line: 132, column: 14, scope: !64)
!71 = !DILocalVariable(name: "argv", arg: 2, scope: !64, file: !6, line: 132, type: !68)
!72 = !DILocation(line: 132, column: 27, scope: !64)
!73 = !DILocation(line: 135, column: 22, scope: !64)
!74 = !DILocation(line: 135, column: 12, scope: !64)
!75 = !DILocation(line: 135, column: 5, scope: !64)
!76 = !DILocation(line: 137, column: 5, scope: !64)
!77 = !DILocation(line: 138, column: 5, scope: !64)
!78 = !DILocation(line: 139, column: 5, scope: !64)
!79 = !DILocation(line: 142, column: 5, scope: !64)
!80 = !DILocation(line: 143, column: 5, scope: !64)
!81 = !DILocation(line: 144, column: 5, scope: !64)
!82 = !DILocation(line: 146, column: 5, scope: !64)
!83 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 64, type: !26, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!84 = !DILocalVariable(name: "structCharVoid", scope: !85, file: !6, line: 74, type: !4)
!85 = distinct !DILexicalBlock(scope: !83, file: !6, line: 73, column: 5)
!86 = !DILocation(line: 74, column: 20, scope: !85)
!87 = !DILocation(line: 74, column: 49, scope: !85)
!88 = !DILocation(line: 74, column: 37, scope: !85)
!89 = !DILocation(line: 75, column: 13, scope: !90)
!90 = distinct !DILexicalBlock(scope: !85, file: !6, line: 75, column: 13)
!91 = !DILocation(line: 75, column: 28, scope: !90)
!92 = !DILocation(line: 75, column: 13, scope: !85)
!93 = !DILocation(line: 75, column: 38, scope: !94)
!94 = distinct !DILexicalBlock(scope: !90, file: !6, line: 75, column: 37)
!95 = !DILocation(line: 76, column: 9, scope: !85)
!96 = !DILocation(line: 76, column: 25, scope: !85)
!97 = !DILocation(line: 76, column: 36, scope: !85)
!98 = !DILocation(line: 78, column: 27, scope: !85)
!99 = !DILocation(line: 78, column: 43, scope: !85)
!100 = !DILocation(line: 78, column: 9, scope: !85)
!101 = !DILocation(line: 80, column: 16, scope: !85)
!102 = !DILocation(line: 80, column: 32, scope: !85)
!103 = !DILocation(line: 80, column: 9, scope: !85)
!104 = !DILocation(line: 81, column: 9, scope: !85)
!105 = !DILocation(line: 81, column: 25, scope: !85)
!106 = !DILocation(line: 81, column: 87, scope: !85)
!107 = !DILocation(line: 82, column: 27, scope: !85)
!108 = !DILocation(line: 82, column: 43, scope: !85)
!109 = !DILocation(line: 82, column: 9, scope: !85)
!110 = !DILocation(line: 83, column: 27, scope: !85)
!111 = !DILocation(line: 83, column: 43, scope: !85)
!112 = !DILocation(line: 83, column: 9, scope: !85)
!113 = !DILocation(line: 84, column: 14, scope: !85)
!114 = !DILocation(line: 84, column: 9, scope: !85)
!115 = !DILocation(line: 88, column: 1, scope: !83)
!116 = distinct !DISubprogram(name: "good2", scope: !6, file: !6, line: 91, type: !26, scopeLine: 92, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!117 = !DILocalVariable(name: "structCharVoid", scope: !118, file: !6, line: 97, type: !4)
!118 = distinct !DILexicalBlock(scope: !116, file: !6, line: 96, column: 5)
!119 = !DILocation(line: 97, column: 20, scope: !118)
!120 = !DILocation(line: 97, column: 49, scope: !118)
!121 = !DILocation(line: 97, column: 37, scope: !118)
!122 = !DILocation(line: 98, column: 13, scope: !123)
!123 = distinct !DILexicalBlock(scope: !118, file: !6, line: 98, column: 13)
!124 = !DILocation(line: 98, column: 28, scope: !123)
!125 = !DILocation(line: 98, column: 13, scope: !118)
!126 = !DILocation(line: 98, column: 38, scope: !127)
!127 = distinct !DILexicalBlock(scope: !123, file: !6, line: 98, column: 37)
!128 = !DILocation(line: 99, column: 9, scope: !118)
!129 = !DILocation(line: 99, column: 25, scope: !118)
!130 = !DILocation(line: 99, column: 36, scope: !118)
!131 = !DILocation(line: 101, column: 27, scope: !118)
!132 = !DILocation(line: 101, column: 43, scope: !118)
!133 = !DILocation(line: 101, column: 9, scope: !118)
!134 = !DILocation(line: 103, column: 16, scope: !118)
!135 = !DILocation(line: 103, column: 32, scope: !118)
!136 = !DILocation(line: 103, column: 9, scope: !118)
!137 = !DILocation(line: 104, column: 9, scope: !118)
!138 = !DILocation(line: 104, column: 25, scope: !118)
!139 = !DILocation(line: 104, column: 87, scope: !118)
!140 = !DILocation(line: 105, column: 27, scope: !118)
!141 = !DILocation(line: 105, column: 43, scope: !118)
!142 = !DILocation(line: 105, column: 9, scope: !118)
!143 = !DILocation(line: 106, column: 27, scope: !118)
!144 = !DILocation(line: 106, column: 43, scope: !118)
!145 = !DILocation(line: 106, column: 9, scope: !118)
!146 = !DILocation(line: 107, column: 14, scope: !118)
!147 = !DILocation(line: 107, column: 9, scope: !118)
!148 = !DILocation(line: 115, column: 1, scope: !116)
