; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !24
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_05_bad() #0 !dbg !32 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticTrue, align 4, !dbg !35
  %tobool = icmp ne i32 %0, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end7, !dbg !37

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !38, metadata !DIExpression()), !dbg !41
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !42
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !43
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !41
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !44
  %cmp = icmp eq %struct._charVoid* %2, null, !dbg !46
  br i1 %cmp, label %if.then1, label %if.end, !dbg !47

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !48
  unreachable, !dbg !48

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !50
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !51
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !52
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !53
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !54
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !54
  %6 = bitcast i8* %5 to i32*, !dbg !55
  call void @printWLine(i32* %6), !dbg !56
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !57
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !58
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !59
  %8 = bitcast i32* %arraydecay to i8*, !dbg !59
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !59
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !60
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !61
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 15, !dbg !60
  store i32 0, i32* %arrayidx, align 4, !dbg !62
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !63
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !64
  %arraydecay5 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 0, !dbg !63
  call void @printWLine(i32* %arraydecay5), !dbg !65
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !66
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !67
  %12 = load i8*, i8** %voidSecond6, align 8, !dbg !67
  %13 = bitcast i8* %12 to i32*, !dbg !68
  call void @printWLine(i32* %13), !dbg !69
  %14 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !70
  %15 = bitcast %struct._charVoid* %14 to i8*, !dbg !70
  call void @free(i8* %15) #6, !dbg !71
  br label %if.end7, !dbg !72

if.end7:                                          ; preds = %if.end, %entry
  ret void, !dbg !73
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_05_good() #0 !dbg !74 {
entry:
  call void @good1(), !dbg !75
  call void @good2(), !dbg !76
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #6, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #6, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !91
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_05_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !94
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_05_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !98 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticFalse, align 4, !dbg !99
  %tobool = icmp ne i32 %0, 0, !dbg !99
  br i1 %tobool, label %if.then, label %if.else, !dbg !101

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !102
  br label %if.end7, !dbg !104

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !105, metadata !DIExpression()), !dbg !108
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !109
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !110
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !108
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !111
  %cmp = icmp eq %struct._charVoid* %2, null, !dbg !113
  br i1 %cmp, label %if.then1, label %if.end, !dbg !114

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !115
  unreachable, !dbg !115

if.end:                                           ; preds = %if.else
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !117
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !118
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !119
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !120
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !121
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !121
  %6 = bitcast i8* %5 to i32*, !dbg !122
  call void @printWLine(i32* %6), !dbg !123
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !124
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !125
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !126
  %8 = bitcast i32* %arraydecay to i8*, !dbg !126
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !126
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !127
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !128
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 15, !dbg !127
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !130
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !131
  %arraydecay5 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 0, !dbg !130
  call void @printWLine(i32* %arraydecay5), !dbg !132
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !133
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !134
  %12 = load i8*, i8** %voidSecond6, align 8, !dbg !134
  %13 = bitcast i8* %12 to i32*, !dbg !135
  call void @printWLine(i32* %13), !dbg !136
  %14 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !137
  %15 = bitcast %struct._charVoid* %14 to i8*, !dbg !137
  call void @free(i8* %15) #6, !dbg !138
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  ret void, !dbg !139
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !140 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticTrue, align 4, !dbg !141
  %tobool = icmp ne i32 %0, 0, !dbg !141
  br i1 %tobool, label %if.then, label %if.end7, !dbg !143

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !144, metadata !DIExpression()), !dbg !147
  %call = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !148
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !149
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !147
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !150
  %cmp = icmp eq %struct._charVoid* %2, null, !dbg !152
  br i1 %cmp, label %if.then1, label %if.end, !dbg !153

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !154
  unreachable, !dbg !154

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !156
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !157
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !158
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !159
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !160
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !160
  %6 = bitcast i8* %5 to i32*, !dbg !161
  call void @printWLine(i32* %6), !dbg !162
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !163
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !164
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !165
  %8 = bitcast i32* %arraydecay to i8*, !dbg !165
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %8, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !165
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !166
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !167
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst3, i64 0, i64 15, !dbg !166
  store i32 0, i32* %arrayidx, align 4, !dbg !168
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !169
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 0, !dbg !170
  %arraydecay5 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 0, !dbg !169
  call void @printWLine(i32* %arraydecay5), !dbg !171
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !172
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %11, i32 0, i32 1, !dbg !173
  %12 = load i8*, i8** %voidSecond6, align 8, !dbg !173
  %13 = bitcast i8* %12 to i32*, !dbg !174
  call void @printWLine(i32* %13), !dbg !175
  %14 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !176
  %15 = bitcast %struct._charVoid* %14 to i8*, !dbg !176
  call void @free(i8* %15) #6, !dbg !177
  br label %if.end7, !dbg !178

if.end7:                                          ; preds = %if.end, %entry
  ret void, !dbg !179
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
!llvm.module.flags = !{!26, !27, !28, !29, !30}
!llvm.ident = !{!31}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !8, line: 34, type: !15, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !23, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !19, !21, !22}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !8, line: 29, baseType: !9)
!8 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_05.c", directory: "/root/SSE-Assessment")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !8, line: 24, size: 640, elements: !10)
!10 = !{!11, !18, !20}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !9, file: !8, line: 26, baseType: !12, size: 512)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 512, elements: !16)
!13 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !14, line: 74, baseType: !15)
!14 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{!17}
!17 = !DISubrange(count: 16)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !9, file: !8, line: 27, baseType: !19, size: 64, offset: 512)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!20 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !9, file: !8, line: 28, baseType: !19, size: 64, offset: 576)
!21 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!22 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!23 = !{!0, !24}
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !8, line: 35, type: !15, isLocal: true, isDefinition: true)
!26 = !{i32 7, !"Dwarf Version", i32 4}
!27 = !{i32 2, !"Debug Info Version", i32 3}
!28 = !{i32 1, !"wchar_size", i32 4}
!29 = !{i32 7, !"uwtable", i32 1}
!30 = !{i32 7, !"frame-pointer", i32 2}
!31 = !{!"clang version 13.0.0"}
!32 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_05_bad", scope: !8, file: !8, line: 39, type: !33, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!33 = !DISubroutineType(types: !34)
!34 = !{null}
!35 = !DILocation(line: 41, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !8, line: 41, column: 8)
!37 = !DILocation(line: 41, column: 8, scope: !32)
!38 = !DILocalVariable(name: "structCharVoid", scope: !39, file: !8, line: 44, type: !6)
!39 = distinct !DILexicalBlock(scope: !40, file: !8, line: 43, column: 9)
!40 = distinct !DILexicalBlock(scope: !36, file: !8, line: 42, column: 5)
!41 = !DILocation(line: 44, column: 24, scope: !39)
!42 = !DILocation(line: 44, column: 53, scope: !39)
!43 = !DILocation(line: 44, column: 41, scope: !39)
!44 = !DILocation(line: 45, column: 17, scope: !45)
!45 = distinct !DILexicalBlock(scope: !39, file: !8, line: 45, column: 17)
!46 = !DILocation(line: 45, column: 32, scope: !45)
!47 = !DILocation(line: 45, column: 17, scope: !39)
!48 = !DILocation(line: 45, column: 42, scope: !49)
!49 = distinct !DILexicalBlock(scope: !45, file: !8, line: 45, column: 41)
!50 = !DILocation(line: 46, column: 13, scope: !39)
!51 = !DILocation(line: 46, column: 29, scope: !39)
!52 = !DILocation(line: 46, column: 40, scope: !39)
!53 = !DILocation(line: 48, column: 35, scope: !39)
!54 = !DILocation(line: 48, column: 51, scope: !39)
!55 = !DILocation(line: 48, column: 24, scope: !39)
!56 = !DILocation(line: 48, column: 13, scope: !39)
!57 = !DILocation(line: 50, column: 20, scope: !39)
!58 = !DILocation(line: 50, column: 36, scope: !39)
!59 = !DILocation(line: 50, column: 13, scope: !39)
!60 = !DILocation(line: 51, column: 13, scope: !39)
!61 = !DILocation(line: 51, column: 29, scope: !39)
!62 = !DILocation(line: 51, column: 94, scope: !39)
!63 = !DILocation(line: 52, column: 35, scope: !39)
!64 = !DILocation(line: 52, column: 51, scope: !39)
!65 = !DILocation(line: 52, column: 13, scope: !39)
!66 = !DILocation(line: 53, column: 35, scope: !39)
!67 = !DILocation(line: 53, column: 51, scope: !39)
!68 = !DILocation(line: 53, column: 24, scope: !39)
!69 = !DILocation(line: 53, column: 13, scope: !39)
!70 = !DILocation(line: 54, column: 18, scope: !39)
!71 = !DILocation(line: 54, column: 13, scope: !39)
!72 = !DILocation(line: 56, column: 5, scope: !40)
!73 = !DILocation(line: 57, column: 1, scope: !32)
!74 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_05_good", scope: !8, file: !8, line: 110, type: !33, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DILocation(line: 112, column: 5, scope: !74)
!76 = !DILocation(line: 113, column: 5, scope: !74)
!77 = !DILocation(line: 114, column: 1, scope: !74)
!78 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 125, type: !79, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!79 = !DISubroutineType(types: !80)
!80 = !{!15, !15, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !8, line: 125, type: !15)
!85 = !DILocation(line: 125, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !8, line: 125, type: !81)
!87 = !DILocation(line: 125, column: 27, scope: !78)
!88 = !DILocation(line: 128, column: 22, scope: !78)
!89 = !DILocation(line: 128, column: 12, scope: !78)
!90 = !DILocation(line: 128, column: 5, scope: !78)
!91 = !DILocation(line: 130, column: 5, scope: !78)
!92 = !DILocation(line: 131, column: 5, scope: !78)
!93 = !DILocation(line: 132, column: 5, scope: !78)
!94 = !DILocation(line: 135, column: 5, scope: !78)
!95 = !DILocation(line: 136, column: 5, scope: !78)
!96 = !DILocation(line: 137, column: 5, scope: !78)
!97 = !DILocation(line: 139, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "good1", scope: !8, file: !8, line: 64, type: !33, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!99 = !DILocation(line: 66, column: 8, scope: !100)
!100 = distinct !DILexicalBlock(scope: !98, file: !8, line: 66, column: 8)
!101 = !DILocation(line: 66, column: 8, scope: !98)
!102 = !DILocation(line: 69, column: 9, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !8, line: 67, column: 5)
!104 = !DILocation(line: 70, column: 5, scope: !103)
!105 = !DILocalVariable(name: "structCharVoid", scope: !106, file: !8, line: 74, type: !6)
!106 = distinct !DILexicalBlock(scope: !107, file: !8, line: 73, column: 9)
!107 = distinct !DILexicalBlock(scope: !100, file: !8, line: 72, column: 5)
!108 = !DILocation(line: 74, column: 24, scope: !106)
!109 = !DILocation(line: 74, column: 53, scope: !106)
!110 = !DILocation(line: 74, column: 41, scope: !106)
!111 = !DILocation(line: 75, column: 17, scope: !112)
!112 = distinct !DILexicalBlock(scope: !106, file: !8, line: 75, column: 17)
!113 = !DILocation(line: 75, column: 32, scope: !112)
!114 = !DILocation(line: 75, column: 17, scope: !106)
!115 = !DILocation(line: 75, column: 42, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !8, line: 75, column: 41)
!117 = !DILocation(line: 76, column: 13, scope: !106)
!118 = !DILocation(line: 76, column: 29, scope: !106)
!119 = !DILocation(line: 76, column: 40, scope: !106)
!120 = !DILocation(line: 78, column: 35, scope: !106)
!121 = !DILocation(line: 78, column: 51, scope: !106)
!122 = !DILocation(line: 78, column: 24, scope: !106)
!123 = !DILocation(line: 78, column: 13, scope: !106)
!124 = !DILocation(line: 80, column: 20, scope: !106)
!125 = !DILocation(line: 80, column: 36, scope: !106)
!126 = !DILocation(line: 80, column: 13, scope: !106)
!127 = !DILocation(line: 81, column: 13, scope: !106)
!128 = !DILocation(line: 81, column: 29, scope: !106)
!129 = !DILocation(line: 81, column: 94, scope: !106)
!130 = !DILocation(line: 82, column: 35, scope: !106)
!131 = !DILocation(line: 82, column: 51, scope: !106)
!132 = !DILocation(line: 82, column: 13, scope: !106)
!133 = !DILocation(line: 83, column: 35, scope: !106)
!134 = !DILocation(line: 83, column: 51, scope: !106)
!135 = !DILocation(line: 83, column: 24, scope: !106)
!136 = !DILocation(line: 83, column: 13, scope: !106)
!137 = !DILocation(line: 84, column: 18, scope: !106)
!138 = !DILocation(line: 84, column: 13, scope: !106)
!139 = !DILocation(line: 87, column: 1, scope: !98)
!140 = distinct !DISubprogram(name: "good2", scope: !8, file: !8, line: 90, type: !33, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!141 = !DILocation(line: 92, column: 8, scope: !142)
!142 = distinct !DILexicalBlock(scope: !140, file: !8, line: 92, column: 8)
!143 = !DILocation(line: 92, column: 8, scope: !140)
!144 = !DILocalVariable(name: "structCharVoid", scope: !145, file: !8, line: 95, type: !6)
!145 = distinct !DILexicalBlock(scope: !146, file: !8, line: 94, column: 9)
!146 = distinct !DILexicalBlock(scope: !142, file: !8, line: 93, column: 5)
!147 = !DILocation(line: 95, column: 24, scope: !145)
!148 = !DILocation(line: 95, column: 53, scope: !145)
!149 = !DILocation(line: 95, column: 41, scope: !145)
!150 = !DILocation(line: 96, column: 17, scope: !151)
!151 = distinct !DILexicalBlock(scope: !145, file: !8, line: 96, column: 17)
!152 = !DILocation(line: 96, column: 32, scope: !151)
!153 = !DILocation(line: 96, column: 17, scope: !145)
!154 = !DILocation(line: 96, column: 42, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !8, line: 96, column: 41)
!156 = !DILocation(line: 97, column: 13, scope: !145)
!157 = !DILocation(line: 97, column: 29, scope: !145)
!158 = !DILocation(line: 97, column: 40, scope: !145)
!159 = !DILocation(line: 99, column: 35, scope: !145)
!160 = !DILocation(line: 99, column: 51, scope: !145)
!161 = !DILocation(line: 99, column: 24, scope: !145)
!162 = !DILocation(line: 99, column: 13, scope: !145)
!163 = !DILocation(line: 101, column: 20, scope: !145)
!164 = !DILocation(line: 101, column: 36, scope: !145)
!165 = !DILocation(line: 101, column: 13, scope: !145)
!166 = !DILocation(line: 102, column: 13, scope: !145)
!167 = !DILocation(line: 102, column: 29, scope: !145)
!168 = !DILocation(line: 102, column: 94, scope: !145)
!169 = !DILocation(line: 103, column: 35, scope: !145)
!170 = !DILocation(line: 103, column: 51, scope: !145)
!171 = !DILocation(line: 103, column: 13, scope: !145)
!172 = !DILocation(line: 104, column: 35, scope: !145)
!173 = !DILocation(line: 104, column: 51, scope: !145)
!174 = !DILocation(line: 104, column: 24, scope: !145)
!175 = !DILocation(line: 104, column: 13, scope: !145)
!176 = !DILocation(line: 105, column: 18, scope: !145)
!177 = !DILocation(line: 105, column: 13, scope: !145)
!178 = !DILocation(line: 107, column: 5, scope: !146)
!179 = !DILocation(line: 108, column: 1, scope: !140)
