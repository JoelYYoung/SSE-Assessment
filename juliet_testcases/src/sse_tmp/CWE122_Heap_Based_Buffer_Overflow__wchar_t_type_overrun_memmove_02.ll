; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_02.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_02.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_02_bad() #0 !dbg !27 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !30, metadata !DIExpression()), !dbg !34
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !35
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !36
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !34
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !37
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !39
  br i1 %cmp, label %if.then, label %if.end, !dbg !40

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !41
  unreachable, !dbg !41

if.end:                                           ; preds = %entry
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !43
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !44
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !45
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !46
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !47
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !47
  %5 = bitcast i8* %4 to i32*, !dbg !48
  call void @printWLine(i32* %5), !dbg !49
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !50
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !51
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !52
  %7 = bitcast i32* %arraydecay to i8*, !dbg !52
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !52
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !53
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !54
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !53
  store i32 0, i32* %arrayidx, align 4, !dbg !55
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !56
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !57
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !56
  call void @printWLine(i32* %arraydecay4), !dbg !58
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !59
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 1, !dbg !60
  %11 = load i8*, i8** %voidSecond5, align 8, !dbg !60
  %12 = bitcast i8* %11 to i32*, !dbg !61
  call void @printWLine(i32* %12), !dbg !62
  ret void, !dbg !63
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_02_good() #0 !dbg !64 {
entry:
  call void @good1(), !dbg !65
  call void @good2(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #6, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #6, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !81
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_02_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_02_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !88 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !89, metadata !DIExpression()), !dbg !93
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !94
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !95
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !93
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !96
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !98
  br i1 %cmp, label %if.then, label %if.end, !dbg !99

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !100
  unreachable, !dbg !100

if.end:                                           ; preds = %entry
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !102
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !103
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !104
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !105
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !106
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !106
  %5 = bitcast i8* %4 to i32*, !dbg !107
  call void @printWLine(i32* %5), !dbg !108
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !109
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !110
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !111
  %7 = bitcast i32* %arraydecay to i8*, !dbg !111
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !111
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !112
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !113
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !112
  store i32 0, i32* %arrayidx, align 4, !dbg !114
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !115
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !116
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !115
  call void @printWLine(i32* %arraydecay4), !dbg !117
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !118
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 1, !dbg !119
  %11 = load i8*, i8** %voidSecond5, align 8, !dbg !119
  %12 = bitcast i8* %11 to i32*, !dbg !120
  call void @printWLine(i32* %12), !dbg !121
  ret void, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !123 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !124, metadata !DIExpression()), !dbg !128
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !129
  %0 = bitcast i8* %call to %struct._charVoid*, !dbg !130
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !128
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !131
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !133
  br i1 %cmp, label %if.then, label %if.end, !dbg !134

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #7, !dbg !135
  unreachable, !dbg !135

if.end:                                           ; preds = %entry
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !137
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !138
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !139
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !140
  %voidSecond1 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !141
  %4 = load i8*, i8** %voidSecond1, align 8, !dbg !141
  %5 = bitcast i8* %4 to i32*, !dbg !142
  call void @printWLine(i32* %5), !dbg !143
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !144
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !145
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !146
  %7 = bitcast i32* %arraydecay to i8*, !dbg !146
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !146
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !147
  %charFirst2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !148
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst2, i64 0, i64 15, !dbg !147
  store i32 0, i32* %arrayidx, align 4, !dbg !149
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !150
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !151
  %arraydecay4 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 0, !dbg !150
  call void @printWLine(i32* %arraydecay4), !dbg !152
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !153
  %voidSecond5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 1, !dbg !154
  %11 = load i8*, i8** %voidSecond5, align 8, !dbg !154
  %12 = bitcast i8* %11 to i32*, !dbg !155
  call void @printWLine(i32* %12), !dbg !156
  ret void, !dbg !157
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_02.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !17, !19, !20}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_02.c", directory: "/root/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !6, line: 24, size: 640, elements: !8)
!8 = !{!9, !16, !18}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !7, file: !6, line: 26, baseType: !10, size: 512)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 512, elements: !14)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !12, line: 74, baseType: !13)
!12 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
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
!27 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_02_bad", scope: !6, file: !6, line: 33, type: !28, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{null}
!30 = !DILocalVariable(name: "structCharVoid", scope: !31, file: !6, line: 38, type: !4)
!31 = distinct !DILexicalBlock(scope: !32, file: !6, line: 37, column: 9)
!32 = distinct !DILexicalBlock(scope: !33, file: !6, line: 36, column: 5)
!33 = distinct !DILexicalBlock(scope: !27, file: !6, line: 35, column: 8)
!34 = !DILocation(line: 38, column: 24, scope: !31)
!35 = !DILocation(line: 38, column: 53, scope: !31)
!36 = !DILocation(line: 38, column: 41, scope: !31)
!37 = !DILocation(line: 39, column: 17, scope: !38)
!38 = distinct !DILexicalBlock(scope: !31, file: !6, line: 39, column: 17)
!39 = !DILocation(line: 39, column: 32, scope: !38)
!40 = !DILocation(line: 39, column: 17, scope: !31)
!41 = !DILocation(line: 39, column: 42, scope: !42)
!42 = distinct !DILexicalBlock(scope: !38, file: !6, line: 39, column: 41)
!43 = !DILocation(line: 40, column: 13, scope: !31)
!44 = !DILocation(line: 40, column: 29, scope: !31)
!45 = !DILocation(line: 40, column: 40, scope: !31)
!46 = !DILocation(line: 42, column: 35, scope: !31)
!47 = !DILocation(line: 42, column: 51, scope: !31)
!48 = !DILocation(line: 42, column: 24, scope: !31)
!49 = !DILocation(line: 42, column: 13, scope: !31)
!50 = !DILocation(line: 44, column: 21, scope: !31)
!51 = !DILocation(line: 44, column: 37, scope: !31)
!52 = !DILocation(line: 44, column: 13, scope: !31)
!53 = !DILocation(line: 45, column: 13, scope: !31)
!54 = !DILocation(line: 45, column: 29, scope: !31)
!55 = !DILocation(line: 45, column: 94, scope: !31)
!56 = !DILocation(line: 46, column: 35, scope: !31)
!57 = !DILocation(line: 46, column: 51, scope: !31)
!58 = !DILocation(line: 46, column: 13, scope: !31)
!59 = !DILocation(line: 47, column: 35, scope: !31)
!60 = !DILocation(line: 47, column: 51, scope: !31)
!61 = !DILocation(line: 47, column: 24, scope: !31)
!62 = !DILocation(line: 47, column: 13, scope: !31)
!63 = !DILocation(line: 50, column: 1, scope: !27)
!64 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_02_good", scope: !6, file: !6, line: 101, type: !28, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 103, column: 5, scope: !64)
!66 = !DILocation(line: 104, column: 5, scope: !64)
!67 = !DILocation(line: 105, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 116, type: !69, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!13, !13, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !6, line: 116, type: !13)
!75 = !DILocation(line: 116, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !6, line: 116, type: !71)
!77 = !DILocation(line: 116, column: 27, scope: !68)
!78 = !DILocation(line: 119, column: 22, scope: !68)
!79 = !DILocation(line: 119, column: 12, scope: !68)
!80 = !DILocation(line: 119, column: 5, scope: !68)
!81 = !DILocation(line: 121, column: 5, scope: !68)
!82 = !DILocation(line: 122, column: 5, scope: !68)
!83 = !DILocation(line: 123, column: 5, scope: !68)
!84 = !DILocation(line: 126, column: 5, scope: !68)
!85 = !DILocation(line: 127, column: 5, scope: !68)
!86 = !DILocation(line: 128, column: 5, scope: !68)
!87 = !DILocation(line: 130, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 57, type: !28, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DILocalVariable(name: "structCharVoid", scope: !90, file: !6, line: 67, type: !4)
!90 = distinct !DILexicalBlock(scope: !91, file: !6, line: 66, column: 9)
!91 = distinct !DILexicalBlock(scope: !92, file: !6, line: 65, column: 5)
!92 = distinct !DILexicalBlock(scope: !88, file: !6, line: 59, column: 8)
!93 = !DILocation(line: 67, column: 24, scope: !90)
!94 = !DILocation(line: 67, column: 53, scope: !90)
!95 = !DILocation(line: 67, column: 41, scope: !90)
!96 = !DILocation(line: 68, column: 17, scope: !97)
!97 = distinct !DILexicalBlock(scope: !90, file: !6, line: 68, column: 17)
!98 = !DILocation(line: 68, column: 32, scope: !97)
!99 = !DILocation(line: 68, column: 17, scope: !90)
!100 = !DILocation(line: 68, column: 42, scope: !101)
!101 = distinct !DILexicalBlock(scope: !97, file: !6, line: 68, column: 41)
!102 = !DILocation(line: 69, column: 13, scope: !90)
!103 = !DILocation(line: 69, column: 29, scope: !90)
!104 = !DILocation(line: 69, column: 40, scope: !90)
!105 = !DILocation(line: 71, column: 35, scope: !90)
!106 = !DILocation(line: 71, column: 51, scope: !90)
!107 = !DILocation(line: 71, column: 24, scope: !90)
!108 = !DILocation(line: 71, column: 13, scope: !90)
!109 = !DILocation(line: 73, column: 21, scope: !90)
!110 = !DILocation(line: 73, column: 37, scope: !90)
!111 = !DILocation(line: 73, column: 13, scope: !90)
!112 = !DILocation(line: 74, column: 13, scope: !90)
!113 = !DILocation(line: 74, column: 29, scope: !90)
!114 = !DILocation(line: 74, column: 94, scope: !90)
!115 = !DILocation(line: 75, column: 35, scope: !90)
!116 = !DILocation(line: 75, column: 51, scope: !90)
!117 = !DILocation(line: 75, column: 13, scope: !90)
!118 = !DILocation(line: 76, column: 35, scope: !90)
!119 = !DILocation(line: 76, column: 51, scope: !90)
!120 = !DILocation(line: 76, column: 24, scope: !90)
!121 = !DILocation(line: 76, column: 13, scope: !90)
!122 = !DILocation(line: 79, column: 1, scope: !88)
!123 = distinct !DISubprogram(name: "good2", scope: !6, file: !6, line: 82, type: !28, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!124 = !DILocalVariable(name: "structCharVoid", scope: !125, file: !6, line: 87, type: !4)
!125 = distinct !DILexicalBlock(scope: !126, file: !6, line: 86, column: 9)
!126 = distinct !DILexicalBlock(scope: !127, file: !6, line: 85, column: 5)
!127 = distinct !DILexicalBlock(scope: !123, file: !6, line: 84, column: 8)
!128 = !DILocation(line: 87, column: 24, scope: !125)
!129 = !DILocation(line: 87, column: 53, scope: !125)
!130 = !DILocation(line: 87, column: 41, scope: !125)
!131 = !DILocation(line: 88, column: 17, scope: !132)
!132 = distinct !DILexicalBlock(scope: !125, file: !6, line: 88, column: 17)
!133 = !DILocation(line: 88, column: 32, scope: !132)
!134 = !DILocation(line: 88, column: 17, scope: !125)
!135 = !DILocation(line: 88, column: 42, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !6, line: 88, column: 41)
!137 = !DILocation(line: 89, column: 13, scope: !125)
!138 = !DILocation(line: 89, column: 29, scope: !125)
!139 = !DILocation(line: 89, column: 40, scope: !125)
!140 = !DILocation(line: 91, column: 35, scope: !125)
!141 = !DILocation(line: 91, column: 51, scope: !125)
!142 = !DILocation(line: 91, column: 24, scope: !125)
!143 = !DILocation(line: 91, column: 13, scope: !125)
!144 = !DILocation(line: 93, column: 21, scope: !125)
!145 = !DILocation(line: 93, column: 37, scope: !125)
!146 = !DILocation(line: 93, column: 13, scope: !125)
!147 = !DILocation(line: 94, column: 13, scope: !125)
!148 = !DILocation(line: 94, column: 29, scope: !125)
!149 = !DILocation(line: 94, column: 94, scope: !125)
!150 = !DILocation(line: 95, column: 35, scope: !125)
!151 = !DILocation(line: 95, column: 51, scope: !125)
!152 = !DILocation(line: 95, column: 13, scope: !125)
!153 = !DILocation(line: 96, column: 35, scope: !125)
!154 = !DILocation(line: 96, column: 51, scope: !125)
!155 = !DILocation(line: 96, column: 24, scope: !125)
!156 = !DILocation(line: 96, column: 13, scope: !125)
!157 = !DILocation(line: 99, column: 1, scope: !123)
