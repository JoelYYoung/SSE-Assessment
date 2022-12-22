; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_14.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_14_bad() #0 !dbg !27 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @globalFive, align 4, !dbg !30
  %cmp = icmp eq i32 %0, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end8, !dbg !33

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !34, metadata !DIExpression()), !dbg !37
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !38
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !39
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !37
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !40
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !42
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !43

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !44
  unreachable, !dbg !44

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !46
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !47
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !48
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !49
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !50
  %5 = load i8*, i8** %voidSecond3, align 8, !dbg !50
  %6 = bitcast i8* %5 to i32*, !dbg !51
  call void @printWLine(i32* %6), !dbg !52
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !53
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !54
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !55
  %8 = bitcast i32* %arraydecay to i8*, !dbg !55
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !55
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !56
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !57
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 15, !dbg !56
  store i32 0, i32* %arrayidx, align 4, !dbg !58
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !59
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !60
  %arraydecay6 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst5, i64 0, i64 0, !dbg !59
  call void @printWLine(i32* %arraydecay6), !dbg !61
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !62
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !63
  %12 = load i8*, i8** %voidSecond7, align 8, !dbg !63
  %13 = bitcast i8* %12 to i32*, !dbg !64
  call void @printWLine(i32* %13), !dbg !65
  br label %if.end8, !dbg !66

if.end8:                                          ; preds = %if.end, %entry
  ret void, !dbg !67
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_14_good() #0 !dbg !68 {
entry:
  call void @good1(), !dbg !69
  call void @good2(), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !72 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !78, metadata !DIExpression()), !dbg !79
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !80, metadata !DIExpression()), !dbg !81
  %call = call i64 @time(i64* null) #6, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #6, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_14_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_14_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !92 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @globalFive, align 4, !dbg !93
  %cmp = icmp ne i32 %0, 5, !dbg !95
  br i1 %cmp, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !97
  br label %if.end8, !dbg !99

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !100, metadata !DIExpression()), !dbg !103
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !104
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !105
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !103
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !106
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !108
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !109

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !110
  unreachable, !dbg !110

if.end:                                           ; preds = %if.else
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !112
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !113
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !114
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !115
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !116
  %5 = load i8*, i8** %voidSecond3, align 8, !dbg !116
  %6 = bitcast i8* %5 to i32*, !dbg !117
  call void @printWLine(i32* %6), !dbg !118
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !119
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !120
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !121
  %8 = bitcast i32* %arraydecay to i8*, !dbg !121
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !121
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !122
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !123
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 15, !dbg !122
  store i32 0, i32* %arrayidx, align 4, !dbg !124
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !125
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !126
  %arraydecay6 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst5, i64 0, i64 0, !dbg !125
  call void @printWLine(i32* %arraydecay6), !dbg !127
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !128
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !129
  %12 = load i8*, i8** %voidSecond7, align 8, !dbg !129
  %13 = bitcast i8* %12 to i32*, !dbg !130
  call void @printWLine(i32* %13), !dbg !131
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !133 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @globalFive, align 4, !dbg !134
  %cmp = icmp eq i32 %0, 5, !dbg !136
  br i1 %cmp, label %if.then, label %if.end8, !dbg !137

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !138, metadata !DIExpression()), !dbg !141
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !142
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !143
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !141
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !144
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !146
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !147

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !148
  unreachable, !dbg !148

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !150
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !151
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !152
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !153
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !154
  %5 = load i8*, i8** %voidSecond3, align 8, !dbg !154
  %6 = bitcast i8* %5 to i32*, !dbg !155
  call void @printWLine(i32* %6), !dbg !156
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !157
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !158
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !159
  %8 = bitcast i32* %arraydecay to i8*, !dbg !159
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !159
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !160
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !161
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 15, !dbg !160
  store i32 0, i32* %arrayidx, align 4, !dbg !162
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !163
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !164
  %arraydecay6 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst5, i64 0, i64 0, !dbg !163
  call void @printWLine(i32* %arraydecay6), !dbg !165
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !166
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !167
  %12 = load i8*, i8** %voidSecond7, align 8, !dbg !167
  %13 = bitcast i8* %12 to i32*, !dbg !168
  call void @printWLine(i32* %13), !dbg !169
  br label %if.end8, !dbg !170

if.end8:                                          ; preds = %if.end, %entry
  ret void, !dbg !171
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_14.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !17, !19, !20}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_14.c", directory: "/root/SSE-Assessment")
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
!27 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_14_bad", scope: !6, file: !6, line: 33, type: !28, scopeLine: 34, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{null}
!30 = !DILocation(line: 35, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !6, line: 35, column: 8)
!32 = !DILocation(line: 35, column: 18, scope: !31)
!33 = !DILocation(line: 35, column: 8, scope: !27)
!34 = !DILocalVariable(name: "structCharVoid", scope: !35, file: !6, line: 38, type: !4)
!35 = distinct !DILexicalBlock(scope: !36, file: !6, line: 37, column: 9)
!36 = distinct !DILexicalBlock(scope: !31, file: !6, line: 36, column: 5)
!37 = !DILocation(line: 38, column: 24, scope: !35)
!38 = !DILocation(line: 38, column: 53, scope: !35)
!39 = !DILocation(line: 38, column: 41, scope: !35)
!40 = !DILocation(line: 39, column: 17, scope: !41)
!41 = distinct !DILexicalBlock(scope: !35, file: !6, line: 39, column: 17)
!42 = !DILocation(line: 39, column: 32, scope: !41)
!43 = !DILocation(line: 39, column: 17, scope: !35)
!44 = !DILocation(line: 39, column: 42, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !6, line: 39, column: 41)
!46 = !DILocation(line: 40, column: 13, scope: !35)
!47 = !DILocation(line: 40, column: 29, scope: !35)
!48 = !DILocation(line: 40, column: 40, scope: !35)
!49 = !DILocation(line: 42, column: 35, scope: !35)
!50 = !DILocation(line: 42, column: 51, scope: !35)
!51 = !DILocation(line: 42, column: 24, scope: !35)
!52 = !DILocation(line: 42, column: 13, scope: !35)
!53 = !DILocation(line: 44, column: 21, scope: !35)
!54 = !DILocation(line: 44, column: 37, scope: !35)
!55 = !DILocation(line: 44, column: 13, scope: !35)
!56 = !DILocation(line: 45, column: 13, scope: !35)
!57 = !DILocation(line: 45, column: 29, scope: !35)
!58 = !DILocation(line: 45, column: 94, scope: !35)
!59 = !DILocation(line: 46, column: 35, scope: !35)
!60 = !DILocation(line: 46, column: 51, scope: !35)
!61 = !DILocation(line: 46, column: 13, scope: !35)
!62 = !DILocation(line: 47, column: 35, scope: !35)
!63 = !DILocation(line: 47, column: 51, scope: !35)
!64 = !DILocation(line: 47, column: 24, scope: !35)
!65 = !DILocation(line: 47, column: 13, scope: !35)
!66 = !DILocation(line: 49, column: 5, scope: !36)
!67 = !DILocation(line: 50, column: 1, scope: !27)
!68 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_14_good", scope: !6, file: !6, line: 101, type: !28, scopeLine: 102, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DILocation(line: 103, column: 5, scope: !68)
!70 = !DILocation(line: 104, column: 5, scope: !68)
!71 = !DILocation(line: 105, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 116, type: !73, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DISubroutineType(types: !74)
!74 = !{!13, !13, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !6, line: 116, type: !13)
!79 = !DILocation(line: 116, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !6, line: 116, type: !75)
!81 = !DILocation(line: 116, column: 27, scope: !72)
!82 = !DILocation(line: 119, column: 22, scope: !72)
!83 = !DILocation(line: 119, column: 12, scope: !72)
!84 = !DILocation(line: 119, column: 5, scope: !72)
!85 = !DILocation(line: 121, column: 5, scope: !72)
!86 = !DILocation(line: 122, column: 5, scope: !72)
!87 = !DILocation(line: 123, column: 5, scope: !72)
!88 = !DILocation(line: 126, column: 5, scope: !72)
!89 = !DILocation(line: 127, column: 5, scope: !72)
!90 = !DILocation(line: 128, column: 5, scope: !72)
!91 = !DILocation(line: 130, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 57, type: !28, scopeLine: 58, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocation(line: 59, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !92, file: !6, line: 59, column: 8)
!95 = !DILocation(line: 59, column: 18, scope: !94)
!96 = !DILocation(line: 59, column: 8, scope: !92)
!97 = !DILocation(line: 62, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !6, line: 60, column: 5)
!99 = !DILocation(line: 63, column: 5, scope: !98)
!100 = !DILocalVariable(name: "structCharVoid", scope: !101, file: !6, line: 67, type: !4)
!101 = distinct !DILexicalBlock(scope: !102, file: !6, line: 66, column: 9)
!102 = distinct !DILexicalBlock(scope: !94, file: !6, line: 65, column: 5)
!103 = !DILocation(line: 67, column: 24, scope: !101)
!104 = !DILocation(line: 67, column: 53, scope: !101)
!105 = !DILocation(line: 67, column: 41, scope: !101)
!106 = !DILocation(line: 68, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !101, file: !6, line: 68, column: 17)
!108 = !DILocation(line: 68, column: 32, scope: !107)
!109 = !DILocation(line: 68, column: 17, scope: !101)
!110 = !DILocation(line: 68, column: 42, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !6, line: 68, column: 41)
!112 = !DILocation(line: 69, column: 13, scope: !101)
!113 = !DILocation(line: 69, column: 29, scope: !101)
!114 = !DILocation(line: 69, column: 40, scope: !101)
!115 = !DILocation(line: 71, column: 35, scope: !101)
!116 = !DILocation(line: 71, column: 51, scope: !101)
!117 = !DILocation(line: 71, column: 24, scope: !101)
!118 = !DILocation(line: 71, column: 13, scope: !101)
!119 = !DILocation(line: 73, column: 21, scope: !101)
!120 = !DILocation(line: 73, column: 37, scope: !101)
!121 = !DILocation(line: 73, column: 13, scope: !101)
!122 = !DILocation(line: 74, column: 13, scope: !101)
!123 = !DILocation(line: 74, column: 29, scope: !101)
!124 = !DILocation(line: 74, column: 94, scope: !101)
!125 = !DILocation(line: 75, column: 35, scope: !101)
!126 = !DILocation(line: 75, column: 51, scope: !101)
!127 = !DILocation(line: 75, column: 13, scope: !101)
!128 = !DILocation(line: 76, column: 35, scope: !101)
!129 = !DILocation(line: 76, column: 51, scope: !101)
!130 = !DILocation(line: 76, column: 24, scope: !101)
!131 = !DILocation(line: 76, column: 13, scope: !101)
!132 = !DILocation(line: 79, column: 1, scope: !92)
!133 = distinct !DISubprogram(name: "good2", scope: !6, file: !6, line: 82, type: !28, scopeLine: 83, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!134 = !DILocation(line: 84, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !133, file: !6, line: 84, column: 8)
!136 = !DILocation(line: 84, column: 18, scope: !135)
!137 = !DILocation(line: 84, column: 8, scope: !133)
!138 = !DILocalVariable(name: "structCharVoid", scope: !139, file: !6, line: 87, type: !4)
!139 = distinct !DILexicalBlock(scope: !140, file: !6, line: 86, column: 9)
!140 = distinct !DILexicalBlock(scope: !135, file: !6, line: 85, column: 5)
!141 = !DILocation(line: 87, column: 24, scope: !139)
!142 = !DILocation(line: 87, column: 53, scope: !139)
!143 = !DILocation(line: 87, column: 41, scope: !139)
!144 = !DILocation(line: 88, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !139, file: !6, line: 88, column: 17)
!146 = !DILocation(line: 88, column: 32, scope: !145)
!147 = !DILocation(line: 88, column: 17, scope: !139)
!148 = !DILocation(line: 88, column: 42, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !6, line: 88, column: 41)
!150 = !DILocation(line: 89, column: 13, scope: !139)
!151 = !DILocation(line: 89, column: 29, scope: !139)
!152 = !DILocation(line: 89, column: 40, scope: !139)
!153 = !DILocation(line: 91, column: 35, scope: !139)
!154 = !DILocation(line: 91, column: 51, scope: !139)
!155 = !DILocation(line: 91, column: 24, scope: !139)
!156 = !DILocation(line: 91, column: 13, scope: !139)
!157 = !DILocation(line: 93, column: 21, scope: !139)
!158 = !DILocation(line: 93, column: 37, scope: !139)
!159 = !DILocation(line: 93, column: 13, scope: !139)
!160 = !DILocation(line: 94, column: 13, scope: !139)
!161 = !DILocation(line: 94, column: 29, scope: !139)
!162 = !DILocation(line: 94, column: 94, scope: !139)
!163 = !DILocation(line: 95, column: 35, scope: !139)
!164 = !DILocation(line: 95, column: 51, scope: !139)
!165 = !DILocation(line: 95, column: 13, scope: !139)
!166 = !DILocation(line: 96, column: 35, scope: !139)
!167 = !DILocation(line: 96, column: 51, scope: !139)
!168 = !DILocation(line: 96, column: 24, scope: !139)
!169 = !DILocation(line: 96, column: 13, scope: !139)
!170 = !DILocation(line: 98, column: 5, scope: !140)
!171 = !DILocation(line: 99, column: 1, scope: !133)
