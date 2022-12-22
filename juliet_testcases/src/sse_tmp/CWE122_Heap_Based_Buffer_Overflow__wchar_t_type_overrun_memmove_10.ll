; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_10.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_10.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@globalTrue = external dso_local global i32, align 4
@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@globalFalse = external dso_local global i32, align 4
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_10_bad() #0 !dbg !27 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @globalTrue, align 4, !dbg !30
  %tobool = icmp ne i32 %0, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end7, !dbg !32

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !33, metadata !DIExpression()), !dbg !36
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !37
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !38
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !36
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !39
  %cmp = icmp eq %struct._charVoid* %2, null, !dbg !41
  br i1 %cmp, label %if.then1, label %if.end, !dbg !42

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !43
  unreachable, !dbg !43

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !45
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !46
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !47
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !48
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !49
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !49
  %6 = bitcast i8* %5 to i32*, !dbg !50
  call void @printWLine(i32* %6), !dbg !51
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !52
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !53
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !54
  %8 = bitcast i32* %arraydecay to i8*, !dbg !54
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !54
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !55
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !56
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 15, !dbg !55
  store i32 0, i32* %arrayidx, align 4, !dbg !57
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !58
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !59
  %arraydecay5 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 0, !dbg !58
  call void @printWLine(i32* %arraydecay5), !dbg !60
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !61
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !62
  %12 = load i8*, i8** %voidSecond6, align 8, !dbg !62
  %13 = bitcast i8* %12 to i32*, !dbg !63
  call void @printWLine(i32* %13), !dbg !64
  br label %if.end7, !dbg !65

if.end7:                                          ; preds = %if.end, %entry
  ret void, !dbg !66
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_10_good() #0 !dbg !67 {
entry:
  call void @good1(), !dbg !68
  call void @good2(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #6, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #6, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !84
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_10_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_10_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !91 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @globalFalse, align 4, !dbg !92
  %tobool = icmp ne i32 %0, 0, !dbg !92
  br i1 %tobool, label %if.then, label %if.else, !dbg !94

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !95
  br label %if.end7, !dbg !97

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !98, metadata !DIExpression()), !dbg !101
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !102
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !103
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !101
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !104
  %cmp = icmp eq %struct._charVoid* %2, null, !dbg !106
  br i1 %cmp, label %if.then1, label %if.end, !dbg !107

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !108
  unreachable, !dbg !108

if.end:                                           ; preds = %if.else
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !110
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !111
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !112
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !113
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !114
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !114
  %6 = bitcast i8* %5 to i32*, !dbg !115
  call void @printWLine(i32* %6), !dbg !116
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !117
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !118
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !119
  %8 = bitcast i32* %arraydecay to i8*, !dbg !119
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !119
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !120
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !121
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 15, !dbg !120
  store i32 0, i32* %arrayidx, align 4, !dbg !122
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !123
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !124
  %arraydecay5 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 0, !dbg !123
  call void @printWLine(i32* %arraydecay5), !dbg !125
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !126
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !127
  %12 = load i8*, i8** %voidSecond6, align 8, !dbg !127
  %13 = bitcast i8* %12 to i32*, !dbg !128
  call void @printWLine(i32* %13), !dbg !129
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  ret void, !dbg !130
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !131 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @globalTrue, align 4, !dbg !132
  %tobool = icmp ne i32 %0, 0, !dbg !132
  br i1 %tobool, label %if.then, label %if.end7, !dbg !134

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !135, metadata !DIExpression()), !dbg !138
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !139
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !140
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !138
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !141
  %cmp = icmp eq %struct._charVoid* %2, null, !dbg !143
  br i1 %cmp, label %if.then1, label %if.end, !dbg !144

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !145
  unreachable, !dbg !145

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !147
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !148
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !149
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !150
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !151
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !151
  %6 = bitcast i8* %5 to i32*, !dbg !152
  call void @printWLine(i32* %6), !dbg !153
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !154
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !155
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !156
  %8 = bitcast i32* %arraydecay to i8*, !dbg !156
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !156
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !157
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !158
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 15, !dbg !157
  store i32 0, i32* %arrayidx, align 4, !dbg !159
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !160
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !161
  %arraydecay5 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 0, !dbg !160
  call void @printWLine(i32* %arraydecay5), !dbg !162
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !163
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !164
  %12 = load i8*, i8** %voidSecond6, align 8, !dbg !164
  %13 = bitcast i8* %12 to i32*, !dbg !165
  call void @printWLine(i32* %13), !dbg !166
  br label %if.end7, !dbg !167

if.end7:                                          ; preds = %if.end, %entry
  ret void, !dbg !168
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_10.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !17, !19, !20}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_10.c", directory: "/root/SSE-Assessment")
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
!27 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_10_bad", scope: !6, file: !6, line: 33, type: !28, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{null}
!30 = !DILocation(line: 35, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !6, line: 35, column: 8)
!32 = !DILocation(line: 35, column: 8, scope: !27)
!33 = !DILocalVariable(name: "structCharVoid", scope: !34, file: !6, line: 38, type: !4)
!34 = distinct !DILexicalBlock(scope: !35, file: !6, line: 37, column: 9)
!35 = distinct !DILexicalBlock(scope: !31, file: !6, line: 36, column: 5)
!36 = !DILocation(line: 38, column: 24, scope: !34)
!37 = !DILocation(line: 38, column: 53, scope: !34)
!38 = !DILocation(line: 38, column: 41, scope: !34)
!39 = !DILocation(line: 39, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !6, line: 39, column: 17)
!41 = !DILocation(line: 39, column: 32, scope: !40)
!42 = !DILocation(line: 39, column: 17, scope: !34)
!43 = !DILocation(line: 39, column: 42, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !6, line: 39, column: 41)
!45 = !DILocation(line: 40, column: 13, scope: !34)
!46 = !DILocation(line: 40, column: 29, scope: !34)
!47 = !DILocation(line: 40, column: 40, scope: !34)
!48 = !DILocation(line: 42, column: 35, scope: !34)
!49 = !DILocation(line: 42, column: 51, scope: !34)
!50 = !DILocation(line: 42, column: 24, scope: !34)
!51 = !DILocation(line: 42, column: 13, scope: !34)
!52 = !DILocation(line: 44, column: 21, scope: !34)
!53 = !DILocation(line: 44, column: 37, scope: !34)
!54 = !DILocation(line: 44, column: 13, scope: !34)
!55 = !DILocation(line: 45, column: 13, scope: !34)
!56 = !DILocation(line: 45, column: 29, scope: !34)
!57 = !DILocation(line: 45, column: 94, scope: !34)
!58 = !DILocation(line: 46, column: 35, scope: !34)
!59 = !DILocation(line: 46, column: 51, scope: !34)
!60 = !DILocation(line: 46, column: 13, scope: !34)
!61 = !DILocation(line: 47, column: 35, scope: !34)
!62 = !DILocation(line: 47, column: 51, scope: !34)
!63 = !DILocation(line: 47, column: 24, scope: !34)
!64 = !DILocation(line: 47, column: 13, scope: !34)
!65 = !DILocation(line: 49, column: 5, scope: !35)
!66 = !DILocation(line: 50, column: 1, scope: !27)
!67 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_10_good", scope: !6, file: !6, line: 101, type: !28, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 103, column: 5, scope: !67)
!69 = !DILocation(line: 104, column: 5, scope: !67)
!70 = !DILocation(line: 105, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 116, type: !72, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!13, !13, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !6, line: 116, type: !13)
!78 = !DILocation(line: 116, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !6, line: 116, type: !74)
!80 = !DILocation(line: 116, column: 27, scope: !71)
!81 = !DILocation(line: 119, column: 22, scope: !71)
!82 = !DILocation(line: 119, column: 12, scope: !71)
!83 = !DILocation(line: 119, column: 5, scope: !71)
!84 = !DILocation(line: 121, column: 5, scope: !71)
!85 = !DILocation(line: 122, column: 5, scope: !71)
!86 = !DILocation(line: 123, column: 5, scope: !71)
!87 = !DILocation(line: 126, column: 5, scope: !71)
!88 = !DILocation(line: 127, column: 5, scope: !71)
!89 = !DILocation(line: 128, column: 5, scope: !71)
!90 = !DILocation(line: 130, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 57, type: !28, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DILocation(line: 59, column: 8, scope: !93)
!93 = distinct !DILexicalBlock(scope: !91, file: !6, line: 59, column: 8)
!94 = !DILocation(line: 59, column: 8, scope: !91)
!95 = !DILocation(line: 62, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !93, file: !6, line: 60, column: 5)
!97 = !DILocation(line: 63, column: 5, scope: !96)
!98 = !DILocalVariable(name: "structCharVoid", scope: !99, file: !6, line: 67, type: !4)
!99 = distinct !DILexicalBlock(scope: !100, file: !6, line: 66, column: 9)
!100 = distinct !DILexicalBlock(scope: !93, file: !6, line: 65, column: 5)
!101 = !DILocation(line: 67, column: 24, scope: !99)
!102 = !DILocation(line: 67, column: 53, scope: !99)
!103 = !DILocation(line: 67, column: 41, scope: !99)
!104 = !DILocation(line: 68, column: 17, scope: !105)
!105 = distinct !DILexicalBlock(scope: !99, file: !6, line: 68, column: 17)
!106 = !DILocation(line: 68, column: 32, scope: !105)
!107 = !DILocation(line: 68, column: 17, scope: !99)
!108 = !DILocation(line: 68, column: 42, scope: !109)
!109 = distinct !DILexicalBlock(scope: !105, file: !6, line: 68, column: 41)
!110 = !DILocation(line: 69, column: 13, scope: !99)
!111 = !DILocation(line: 69, column: 29, scope: !99)
!112 = !DILocation(line: 69, column: 40, scope: !99)
!113 = !DILocation(line: 71, column: 35, scope: !99)
!114 = !DILocation(line: 71, column: 51, scope: !99)
!115 = !DILocation(line: 71, column: 24, scope: !99)
!116 = !DILocation(line: 71, column: 13, scope: !99)
!117 = !DILocation(line: 73, column: 21, scope: !99)
!118 = !DILocation(line: 73, column: 37, scope: !99)
!119 = !DILocation(line: 73, column: 13, scope: !99)
!120 = !DILocation(line: 74, column: 13, scope: !99)
!121 = !DILocation(line: 74, column: 29, scope: !99)
!122 = !DILocation(line: 74, column: 94, scope: !99)
!123 = !DILocation(line: 75, column: 35, scope: !99)
!124 = !DILocation(line: 75, column: 51, scope: !99)
!125 = !DILocation(line: 75, column: 13, scope: !99)
!126 = !DILocation(line: 76, column: 35, scope: !99)
!127 = !DILocation(line: 76, column: 51, scope: !99)
!128 = !DILocation(line: 76, column: 24, scope: !99)
!129 = !DILocation(line: 76, column: 13, scope: !99)
!130 = !DILocation(line: 79, column: 1, scope: !91)
!131 = distinct !DISubprogram(name: "good2", scope: !6, file: !6, line: 82, type: !28, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!132 = !DILocation(line: 84, column: 8, scope: !133)
!133 = distinct !DILexicalBlock(scope: !131, file: !6, line: 84, column: 8)
!134 = !DILocation(line: 84, column: 8, scope: !131)
!135 = !DILocalVariable(name: "structCharVoid", scope: !136, file: !6, line: 87, type: !4)
!136 = distinct !DILexicalBlock(scope: !137, file: !6, line: 86, column: 9)
!137 = distinct !DILexicalBlock(scope: !133, file: !6, line: 85, column: 5)
!138 = !DILocation(line: 87, column: 24, scope: !136)
!139 = !DILocation(line: 87, column: 53, scope: !136)
!140 = !DILocation(line: 87, column: 41, scope: !136)
!141 = !DILocation(line: 88, column: 17, scope: !142)
!142 = distinct !DILexicalBlock(scope: !136, file: !6, line: 88, column: 17)
!143 = !DILocation(line: 88, column: 32, scope: !142)
!144 = !DILocation(line: 88, column: 17, scope: !136)
!145 = !DILocation(line: 88, column: 42, scope: !146)
!146 = distinct !DILexicalBlock(scope: !142, file: !6, line: 88, column: 41)
!147 = !DILocation(line: 89, column: 13, scope: !136)
!148 = !DILocation(line: 89, column: 29, scope: !136)
!149 = !DILocation(line: 89, column: 40, scope: !136)
!150 = !DILocation(line: 91, column: 35, scope: !136)
!151 = !DILocation(line: 91, column: 51, scope: !136)
!152 = !DILocation(line: 91, column: 24, scope: !136)
!153 = !DILocation(line: 91, column: 13, scope: !136)
!154 = !DILocation(line: 93, column: 21, scope: !136)
!155 = !DILocation(line: 93, column: 37, scope: !136)
!156 = !DILocation(line: 93, column: 13, scope: !136)
!157 = !DILocation(line: 94, column: 13, scope: !136)
!158 = !DILocation(line: 94, column: 29, scope: !136)
!159 = !DILocation(line: 94, column: 94, scope: !136)
!160 = !DILocation(line: 95, column: 35, scope: !136)
!161 = !DILocation(line: 95, column: 51, scope: !136)
!162 = !DILocation(line: 95, column: 13, scope: !136)
!163 = !DILocation(line: 96, column: 35, scope: !136)
!164 = !DILocation(line: 96, column: 51, scope: !136)
!165 = !DILocation(line: 96, column: 24, scope: !136)
!166 = !DILocation(line: 96, column: 13, scope: !136)
!167 = !DILocation(line: 98, column: 5, scope: !137)
!168 = !DILocation(line: 99, column: 1, scope: !131)
