; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_07_bad() #0 !dbg !30 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticFive, align 4, !dbg !33
  %cmp = icmp eq i32 %0, 5, !dbg !35
  br i1 %cmp, label %if.then, label %if.end8, !dbg !36

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !37, metadata !DIExpression()), !dbg !40
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !41
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !42
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !40
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !43
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !45
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !46

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !47
  unreachable, !dbg !47

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !49
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !50
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !51
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !52
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !53
  %5 = load i8*, i8** %voidSecond3, align 8, !dbg !53
  %6 = bitcast i8* %5 to i32*, !dbg !54
  call void @printWLine(i32* %6), !dbg !55
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !56
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !57
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !58
  %8 = bitcast i32* %arraydecay to i8*, !dbg !58
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !58
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !59
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !60
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 15, !dbg !59
  store i32 0, i32* %arrayidx, align 4, !dbg !61
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !62
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !63
  %arraydecay6 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst5, i64 0, i64 0, !dbg !62
  call void @printWLine(i32* %arraydecay6), !dbg !64
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !65
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !66
  %12 = load i8*, i8** %voidSecond7, align 8, !dbg !66
  %13 = bitcast i8* %12 to i32*, !dbg !67
  call void @printWLine(i32* %13), !dbg !68
  %14 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !69
  %15 = bitcast %struct._charVoid* %14 to i8*, !dbg !69
  call void @free(i8* %15) #6, !dbg !70
  br label %if.end8, !dbg !71

if.end8:                                          ; preds = %if.end, %entry
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

declare dso_local void @printWLine(i32*) #4

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_07_good() #0 !dbg !73 {
entry:
  call void @good1(), !dbg !74
  call void @good2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #6, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #6, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_07_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_07_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !97 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticFive, align 4, !dbg !98
  %cmp = icmp ne i32 %0, 5, !dbg !100
  br i1 %cmp, label %if.then, label %if.else, !dbg !101

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !102
  br label %if.end8, !dbg !104

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !105, metadata !DIExpression()), !dbg !108
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !109
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !110
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !108
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !111
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !113
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !114

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !115
  unreachable, !dbg !115

if.end:                                           ; preds = %if.else
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !117
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !118
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !119
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !120
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !121
  %5 = load i8*, i8** %voidSecond3, align 8, !dbg !121
  %6 = bitcast i8* %5 to i32*, !dbg !122
  call void @printWLine(i32* %6), !dbg !123
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !124
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !125
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !126
  %8 = bitcast i32* %arraydecay to i8*, !dbg !126
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !126
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !127
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !128
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 15, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !130
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !131
  %arraydecay6 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst5, i64 0, i64 0, !dbg !130
  call void @printWLine(i32* %arraydecay6), !dbg !132
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !133
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !134
  %12 = load i8*, i8** %voidSecond7, align 8, !dbg !134
  %13 = bitcast i8* %12 to i32*, !dbg !135
  call void @printWLine(i32* %13), !dbg !136
  %14 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !137
  %15 = bitcast %struct._charVoid* %14 to i8*, !dbg !137
  call void @free(i8* %15) #6, !dbg !138
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  ret void, !dbg !139
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !140 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticFive, align 4, !dbg !141
  %cmp = icmp eq i32 %0, 5, !dbg !143
  br i1 %cmp, label %if.then, label %if.end8, !dbg !144

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !145, metadata !DIExpression()), !dbg !148
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !149
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !150
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !148
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !151
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !153
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !154

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !155
  unreachable, !dbg !155

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !157
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !158
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !159
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !160
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !161
  %5 = load i8*, i8** %voidSecond3, align 8, !dbg !161
  %6 = bitcast i8* %5 to i32*, !dbg !162
  call void @printWLine(i32* %6), !dbg !163
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !164
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !165
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !166
  %8 = bitcast i32* %arraydecay to i8*, !dbg !166
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !166
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !167
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !168
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 15, !dbg !167
  store i32 0, i32* %arrayidx, align 4, !dbg !169
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !170
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !171
  %arraydecay6 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst5, i64 0, i64 0, !dbg !170
  call void @printWLine(i32* %arraydecay6), !dbg !172
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !173
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !174
  %12 = load i8*, i8** %voidSecond7, align 8, !dbg !174
  %13 = bitcast i8* %12 to i32*, !dbg !175
  call void @printWLine(i32* %13), !dbg !176
  %14 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !177
  %15 = bitcast %struct._charVoid* %14 to i8*, !dbg !177
  call void @free(i8* %15) #6, !dbg !178
  br label %if.end8, !dbg !179

if.end8:                                          ; preds = %if.end, %entry
  ret void, !dbg !180
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { argmemonly nofree nounwind willreturn }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!24, !25, !26, !27, !28}
!llvm.ident = !{!29}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 34, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !23, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !19, !21, !22}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !8, line: 29, baseType: !9)
!8 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !8, line: 24, size: 640, elements: !10)
!10 = !{!11, !18, !20}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !9, file: !8, line: 26, baseType: !12, size: 512)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 512, elements: !16)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !14, line: 74, baseType: !15)
!14 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{!17}
!17 = !DISubrange(count: 16)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !9, file: !8, line: 27, baseType: !19, size: 64, offset: 512)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !9, file: !8, line: 28, baseType: !19, size: 64, offset: 576)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!22 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!23 = !{!0}
!24 = !{i32 7, !"Dwarf Version", i32 4}
!25 = !{i32 2, !"Debug Info Version", i32 3}
!26 = !{i32 1, !"wchar_size", i32 4}
!27 = !{i32 7, !"uwtable", i32 1}
!28 = !{i32 7, !"frame-pointer", i32 2}
!29 = !{!"clang version 13.0.0"}
!30 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_07_bad", scope: !8, file: !8, line: 38, type: !31, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!31 = !DISubroutineType(types: !32)
!32 = !{null}
!33 = !DILocation(line: 40, column: 8, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !8, line: 40, column: 8)
!35 = !DILocation(line: 40, column: 18, scope: !34)
!36 = !DILocation(line: 40, column: 8, scope: !30)
!37 = !DILocalVariable(name: "structCharVoid", scope: !38, file: !8, line: 43, type: !6)
!38 = distinct !DILexicalBlock(scope: !39, file: !8, line: 42, column: 9)
!39 = distinct !DILexicalBlock(scope: !34, file: !8, line: 41, column: 5)
!40 = !DILocation(line: 43, column: 24, scope: !38)
!41 = !DILocation(line: 43, column: 53, scope: !38)
!42 = !DILocation(line: 43, column: 41, scope: !38)
!43 = !DILocation(line: 44, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !8, line: 44, column: 17)
!45 = !DILocation(line: 44, column: 32, scope: !44)
!46 = !DILocation(line: 44, column: 17, scope: !38)
!47 = !DILocation(line: 44, column: 42, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !8, line: 44, column: 41)
!49 = !DILocation(line: 45, column: 13, scope: !38)
!50 = !DILocation(line: 45, column: 29, scope: !38)
!51 = !DILocation(line: 45, column: 40, scope: !38)
!52 = !DILocation(line: 47, column: 35, scope: !38)
!53 = !DILocation(line: 47, column: 51, scope: !38)
!54 = !DILocation(line: 47, column: 24, scope: !38)
!55 = !DILocation(line: 47, column: 13, scope: !38)
!56 = !DILocation(line: 49, column: 20, scope: !38)
!57 = !DILocation(line: 49, column: 36, scope: !38)
!58 = !DILocation(line: 49, column: 13, scope: !38)
!59 = !DILocation(line: 50, column: 13, scope: !38)
!60 = !DILocation(line: 50, column: 29, scope: !38)
!61 = !DILocation(line: 50, column: 94, scope: !38)
!62 = !DILocation(line: 51, column: 35, scope: !38)
!63 = !DILocation(line: 51, column: 51, scope: !38)
!64 = !DILocation(line: 51, column: 13, scope: !38)
!65 = !DILocation(line: 52, column: 35, scope: !38)
!66 = !DILocation(line: 52, column: 51, scope: !38)
!67 = !DILocation(line: 52, column: 24, scope: !38)
!68 = !DILocation(line: 52, column: 13, scope: !38)
!69 = !DILocation(line: 53, column: 18, scope: !38)
!70 = !DILocation(line: 53, column: 13, scope: !38)
!71 = !DILocation(line: 55, column: 5, scope: !39)
!72 = !DILocation(line: 56, column: 1, scope: !30)
!73 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_07_good", scope: !8, file: !8, line: 109, type: !31, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!74 = !DILocation(line: 111, column: 5, scope: !73)
!75 = !DILocation(line: 112, column: 5, scope: !73)
!76 = !DILocation(line: 113, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 124, type: !78, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!78 = !DISubroutineType(types: !79)
!79 = !{!15, !15, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !8, line: 124, type: !15)
!84 = !DILocation(line: 124, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !8, line: 124, type: !80)
!86 = !DILocation(line: 124, column: 27, scope: !77)
!87 = !DILocation(line: 127, column: 22, scope: !77)
!88 = !DILocation(line: 127, column: 12, scope: !77)
!89 = !DILocation(line: 127, column: 5, scope: !77)
!90 = !DILocation(line: 129, column: 5, scope: !77)
!91 = !DILocation(line: 130, column: 5, scope: !77)
!92 = !DILocation(line: 131, column: 5, scope: !77)
!93 = !DILocation(line: 134, column: 5, scope: !77)
!94 = !DILocation(line: 135, column: 5, scope: !77)
!95 = !DILocation(line: 136, column: 5, scope: !77)
!96 = !DILocation(line: 138, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "good1", scope: !8, file: !8, line: 63, type: !31, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!98 = !DILocation(line: 65, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !97, file: !8, line: 65, column: 8)
!100 = !DILocation(line: 65, column: 18, scope: !99)
!101 = !DILocation(line: 65, column: 8, scope: !97)
!102 = !DILocation(line: 68, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !8, line: 66, column: 5)
!104 = !DILocation(line: 69, column: 5, scope: !103)
!105 = !DILocalVariable(name: "structCharVoid", scope: !106, file: !8, line: 73, type: !6)
!106 = distinct !DILexicalBlock(scope: !107, file: !8, line: 72, column: 9)
!107 = distinct !DILexicalBlock(scope: !99, file: !8, line: 71, column: 5)
!108 = !DILocation(line: 73, column: 24, scope: !106)
!109 = !DILocation(line: 73, column: 53, scope: !106)
!110 = !DILocation(line: 73, column: 41, scope: !106)
!111 = !DILocation(line: 74, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !106, file: !8, line: 74, column: 17)
!113 = !DILocation(line: 74, column: 32, scope: !112)
!114 = !DILocation(line: 74, column: 17, scope: !106)
!115 = !DILocation(line: 74, column: 42, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !8, line: 74, column: 41)
!117 = !DILocation(line: 75, column: 13, scope: !106)
!118 = !DILocation(line: 75, column: 29, scope: !106)
!119 = !DILocation(line: 75, column: 40, scope: !106)
!120 = !DILocation(line: 77, column: 35, scope: !106)
!121 = !DILocation(line: 77, column: 51, scope: !106)
!122 = !DILocation(line: 77, column: 24, scope: !106)
!123 = !DILocation(line: 77, column: 13, scope: !106)
!124 = !DILocation(line: 79, column: 20, scope: !106)
!125 = !DILocation(line: 79, column: 36, scope: !106)
!126 = !DILocation(line: 79, column: 13, scope: !106)
!127 = !DILocation(line: 80, column: 13, scope: !106)
!128 = !DILocation(line: 80, column: 29, scope: !106)
!129 = !DILocation(line: 80, column: 94, scope: !106)
!130 = !DILocation(line: 81, column: 35, scope: !106)
!131 = !DILocation(line: 81, column: 51, scope: !106)
!132 = !DILocation(line: 81, column: 13, scope: !106)
!133 = !DILocation(line: 82, column: 35, scope: !106)
!134 = !DILocation(line: 82, column: 51, scope: !106)
!135 = !DILocation(line: 82, column: 24, scope: !106)
!136 = !DILocation(line: 82, column: 13, scope: !106)
!137 = !DILocation(line: 83, column: 18, scope: !106)
!138 = !DILocation(line: 83, column: 13, scope: !106)
!139 = !DILocation(line: 86, column: 1, scope: !97)
!140 = distinct !DISubprogram(name: "good2", scope: !8, file: !8, line: 89, type: !31, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!141 = !DILocation(line: 91, column: 8, scope: !142)
!142 = distinct !DILexicalBlock(scope: !140, file: !8, line: 91, column: 8)
!143 = !DILocation(line: 91, column: 18, scope: !142)
!144 = !DILocation(line: 91, column: 8, scope: !140)
!145 = !DILocalVariable(name: "structCharVoid", scope: !146, file: !8, line: 94, type: !6)
!146 = distinct !DILexicalBlock(scope: !147, file: !8, line: 93, column: 9)
!147 = distinct !DILexicalBlock(scope: !142, file: !8, line: 92, column: 5)
!148 = !DILocation(line: 94, column: 24, scope: !146)
!149 = !DILocation(line: 94, column: 53, scope: !146)
!150 = !DILocation(line: 94, column: 41, scope: !146)
!151 = !DILocation(line: 95, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !146, file: !8, line: 95, column: 17)
!153 = !DILocation(line: 95, column: 32, scope: !152)
!154 = !DILocation(line: 95, column: 17, scope: !146)
!155 = !DILocation(line: 95, column: 42, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !8, line: 95, column: 41)
!157 = !DILocation(line: 96, column: 13, scope: !146)
!158 = !DILocation(line: 96, column: 29, scope: !146)
!159 = !DILocation(line: 96, column: 40, scope: !146)
!160 = !DILocation(line: 98, column: 35, scope: !146)
!161 = !DILocation(line: 98, column: 51, scope: !146)
!162 = !DILocation(line: 98, column: 24, scope: !146)
!163 = !DILocation(line: 98, column: 13, scope: !146)
!164 = !DILocation(line: 100, column: 20, scope: !146)
!165 = !DILocation(line: 100, column: 36, scope: !146)
!166 = !DILocation(line: 100, column: 13, scope: !146)
!167 = !DILocation(line: 101, column: 13, scope: !146)
!168 = !DILocation(line: 101, column: 29, scope: !146)
!169 = !DILocation(line: 101, column: 94, scope: !146)
!170 = !DILocation(line: 102, column: 35, scope: !146)
!171 = !DILocation(line: 102, column: 51, scope: !146)
!172 = !DILocation(line: 102, column: 13, scope: !146)
!173 = !DILocation(line: 103, column: 35, scope: !146)
!174 = !DILocation(line: 103, column: 51, scope: !146)
!175 = !DILocation(line: 103, column: 24, scope: !146)
!176 = !DILocation(line: 103, column: 13, scope: !146)
!177 = !DILocation(line: 104, column: 18, scope: !146)
!178 = !DILocation(line: 104, column: 13, scope: !146)
!179 = !DILocation(line: 106, column: 5, scope: !147)
!180 = !DILocation(line: 107, column: 1, scope: !140)
