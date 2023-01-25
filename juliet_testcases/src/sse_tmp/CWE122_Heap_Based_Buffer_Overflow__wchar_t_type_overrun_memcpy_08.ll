; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i32], i8*, i8* }

@.str = private unnamed_addr constant [32 x i32] [i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55, i32 56, i32 57, i32 97, i32 98, i32 99, i32 100, i32 101, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_08_bad() #0 !dbg !27 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %call = call i32 @staticReturnsTrue(), !dbg !30
  %tobool = icmp ne i32 %call, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end8, !dbg !32

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !33, metadata !DIExpression()), !dbg !36
  %call1 = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !37
  %0 = bitcast i8* %call1 to %struct._charVoid*, !dbg !38
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !36
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !39
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !41
  br i1 %cmp, label %if.then2, label %if.end, !dbg !42

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !43
  unreachable, !dbg !43

if.end:                                           ; preds = %if.then
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !45
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !46
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !47
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !48
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !49
  %4 = load i8*, i8** %voidSecond3, align 8, !dbg !49
  %5 = bitcast i8* %4 to i32*, !dbg !50
  call void @printWLine(i32* %5), !dbg !51
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !52
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !53
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !54
  %7 = bitcast i32* %arraydecay to i8*, !dbg !54
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !54
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !55
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !56
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 15, !dbg !55
  store i32 0, i32* %arrayidx, align 4, !dbg !57
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !58
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !59
  %arraydecay6 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst5, i64 0, i64 0, !dbg !58
  call void @printWLine(i32* %arraydecay6), !dbg !60
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !61
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 1, !dbg !62
  %11 = load i8*, i8** %voidSecond7, align 8, !dbg !62
  %12 = bitcast i8* %11 to i32*, !dbg !63
  call void @printWLine(i32* %12), !dbg !64
  %13 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !65
  %14 = bitcast %struct._charVoid* %13 to i8*, !dbg !65
  call void @free(i8* %14) #6, !dbg !66
  br label %if.end8, !dbg !67

if.end8:                                          ; preds = %if.end, %entry
  ret void, !dbg !68
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_08_good() #0 !dbg !69 {
entry:
  call void @good1(), !dbg !70
  call void @good2(), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !73 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #6, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #6, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_08_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_08_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !93 {
entry:
  ret i32 1, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !97 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %call = call i32 @staticReturnsFalse(), !dbg !98
  %tobool = icmp ne i32 %call, 0, !dbg !98
  br i1 %tobool, label %if.then, label %if.else, !dbg !100

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !101
  br label %if.end8, !dbg !103

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !104, metadata !DIExpression()), !dbg !107
  %call1 = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !108
  %0 = bitcast i8* %call1 to %struct._charVoid*, !dbg !109
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !107
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !110
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !112
  br i1 %cmp, label %if.then2, label %if.end, !dbg !113

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !114
  unreachable, !dbg !114

if.end:                                           ; preds = %if.else
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !116
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !117
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !118
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !119
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !120
  %4 = load i8*, i8** %voidSecond3, align 8, !dbg !120
  %5 = bitcast i8* %4 to i32*, !dbg !121
  call void @printWLine(i32* %5), !dbg !122
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !123
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !124
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !125
  %7 = bitcast i32* %arraydecay to i8*, !dbg !125
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !125
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !126
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !127
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 15, !dbg !126
  store i32 0, i32* %arrayidx, align 4, !dbg !128
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !129
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !130
  %arraydecay6 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst5, i64 0, i64 0, !dbg !129
  call void @printWLine(i32* %arraydecay6), !dbg !131
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !132
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 1, !dbg !133
  %11 = load i8*, i8** %voidSecond7, align 8, !dbg !133
  %12 = bitcast i8* %11 to i32*, !dbg !134
  call void @printWLine(i32* %12), !dbg !135
  %13 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !136
  %14 = bitcast %struct._charVoid* %13 to i8*, !dbg !136
  call void @free(i8* %14) #6, !dbg !137
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  ret void, !dbg !138
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !139 {
entry:
  ret i32 0, !dbg !140
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !141 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %call = call i32 @staticReturnsTrue(), !dbg !142
  %tobool = icmp ne i32 %call, 0, !dbg !142
  br i1 %tobool, label %if.then, label %if.end8, !dbg !144

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !145, metadata !DIExpression()), !dbg !148
  %call1 = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !149
  %0 = bitcast i8* %call1 to %struct._charVoid*, !dbg !150
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !148
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !151
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !153
  br i1 %cmp, label %if.then2, label %if.end, !dbg !154

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !155
  unreachable, !dbg !155

if.end:                                           ; preds = %if.then
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !157
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !158
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !159
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !160
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !161
  %4 = load i8*, i8** %voidSecond3, align 8, !dbg !161
  %5 = bitcast i8* %4 to i32*, !dbg !162
  call void @printWLine(i32* %5), !dbg !163
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !164
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !165
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !166
  %7 = bitcast i32* %arraydecay to i8*, !dbg !166
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !166
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !167
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !168
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 15, !dbg !167
  store i32 0, i32* %arrayidx, align 4, !dbg !169
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !170
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !171
  %arraydecay6 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst5, i64 0, i64 0, !dbg !170
  call void @printWLine(i32* %arraydecay6), !dbg !172
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !173
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 1, !dbg !174
  %11 = load i8*, i8** %voidSecond7, align 8, !dbg !174
  %12 = bitcast i8* %11 to i32*, !dbg !175
  call void @printWLine(i32* %12), !dbg !176
  %13 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !177
  %14 = bitcast %struct._charVoid* %13 to i8*, !dbg !177
  call void @free(i8* %14) #6, !dbg !178
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

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!21, !22, !23, !24, !25}
!llvm.ident = !{!26}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !17, !19, !20}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!7 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !6, line: 24, size: 640, elements: !8)
!8 = !{!9, !16, !18}
!9 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !7, file: !6, line: 26, baseType: !10, size: 512)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !11, size: 512, elements: !14)
!11 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !12, line: 74, baseType: !13)
!12 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
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
!27 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_08_bad", scope: !6, file: !6, line: 46, type: !28, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!28 = !DISubroutineType(types: !29)
!29 = !{null}
!30 = !DILocation(line: 48, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !6, line: 48, column: 8)
!32 = !DILocation(line: 48, column: 8, scope: !27)
!33 = !DILocalVariable(name: "structCharVoid", scope: !34, file: !6, line: 51, type: !4)
!34 = distinct !DILexicalBlock(scope: !35, file: !6, line: 50, column: 9)
!35 = distinct !DILexicalBlock(scope: !31, file: !6, line: 49, column: 5)
!36 = !DILocation(line: 51, column: 24, scope: !34)
!37 = !DILocation(line: 51, column: 53, scope: !34)
!38 = !DILocation(line: 51, column: 41, scope: !34)
!39 = !DILocation(line: 52, column: 17, scope: !40)
!40 = distinct !DILexicalBlock(scope: !34, file: !6, line: 52, column: 17)
!41 = !DILocation(line: 52, column: 32, scope: !40)
!42 = !DILocation(line: 52, column: 17, scope: !34)
!43 = !DILocation(line: 52, column: 42, scope: !44)
!44 = distinct !DILexicalBlock(scope: !40, file: !6, line: 52, column: 41)
!45 = !DILocation(line: 53, column: 13, scope: !34)
!46 = !DILocation(line: 53, column: 29, scope: !34)
!47 = !DILocation(line: 53, column: 40, scope: !34)
!48 = !DILocation(line: 55, column: 35, scope: !34)
!49 = !DILocation(line: 55, column: 51, scope: !34)
!50 = !DILocation(line: 55, column: 24, scope: !34)
!51 = !DILocation(line: 55, column: 13, scope: !34)
!52 = !DILocation(line: 57, column: 20, scope: !34)
!53 = !DILocation(line: 57, column: 36, scope: !34)
!54 = !DILocation(line: 57, column: 13, scope: !34)
!55 = !DILocation(line: 58, column: 13, scope: !34)
!56 = !DILocation(line: 58, column: 29, scope: !34)
!57 = !DILocation(line: 58, column: 94, scope: !34)
!58 = !DILocation(line: 59, column: 35, scope: !34)
!59 = !DILocation(line: 59, column: 51, scope: !34)
!60 = !DILocation(line: 59, column: 13, scope: !34)
!61 = !DILocation(line: 60, column: 35, scope: !34)
!62 = !DILocation(line: 60, column: 51, scope: !34)
!63 = !DILocation(line: 60, column: 24, scope: !34)
!64 = !DILocation(line: 60, column: 13, scope: !34)
!65 = !DILocation(line: 61, column: 18, scope: !34)
!66 = !DILocation(line: 61, column: 13, scope: !34)
!67 = !DILocation(line: 63, column: 5, scope: !35)
!68 = !DILocation(line: 64, column: 1, scope: !27)
!69 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memcpy_08_good", scope: !6, file: !6, line: 117, type: !28, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!70 = !DILocation(line: 119, column: 5, scope: !69)
!71 = !DILocation(line: 120, column: 5, scope: !69)
!72 = !DILocation(line: 121, column: 1, scope: !69)
!73 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 132, type: !74, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DISubroutineType(types: !75)
!75 = !{!13, !13, !76}
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !73, file: !6, line: 132, type: !13)
!80 = !DILocation(line: 132, column: 14, scope: !73)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !73, file: !6, line: 132, type: !76)
!82 = !DILocation(line: 132, column: 27, scope: !73)
!83 = !DILocation(line: 135, column: 22, scope: !73)
!84 = !DILocation(line: 135, column: 12, scope: !73)
!85 = !DILocation(line: 135, column: 5, scope: !73)
!86 = !DILocation(line: 137, column: 5, scope: !73)
!87 = !DILocation(line: 138, column: 5, scope: !73)
!88 = !DILocation(line: 139, column: 5, scope: !73)
!89 = !DILocation(line: 142, column: 5, scope: !73)
!90 = !DILocation(line: 143, column: 5, scope: !73)
!91 = !DILocation(line: 144, column: 5, scope: !73)
!92 = !DILocation(line: 146, column: 5, scope: !73)
!93 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !6, file: !6, line: 34, type: !94, scopeLine: 35, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!13}
!96 = !DILocation(line: 36, column: 5, scope: !93)
!97 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 71, type: !28, scopeLine: 72, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocation(line: 73, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !97, file: !6, line: 73, column: 8)
!100 = !DILocation(line: 73, column: 8, scope: !97)
!101 = !DILocation(line: 76, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !6, line: 74, column: 5)
!103 = !DILocation(line: 77, column: 5, scope: !102)
!104 = !DILocalVariable(name: "structCharVoid", scope: !105, file: !6, line: 81, type: !4)
!105 = distinct !DILexicalBlock(scope: !106, file: !6, line: 80, column: 9)
!106 = distinct !DILexicalBlock(scope: !99, file: !6, line: 79, column: 5)
!107 = !DILocation(line: 81, column: 24, scope: !105)
!108 = !DILocation(line: 81, column: 53, scope: !105)
!109 = !DILocation(line: 81, column: 41, scope: !105)
!110 = !DILocation(line: 82, column: 17, scope: !111)
!111 = distinct !DILexicalBlock(scope: !105, file: !6, line: 82, column: 17)
!112 = !DILocation(line: 82, column: 32, scope: !111)
!113 = !DILocation(line: 82, column: 17, scope: !105)
!114 = !DILocation(line: 82, column: 42, scope: !115)
!115 = distinct !DILexicalBlock(scope: !111, file: !6, line: 82, column: 41)
!116 = !DILocation(line: 83, column: 13, scope: !105)
!117 = !DILocation(line: 83, column: 29, scope: !105)
!118 = !DILocation(line: 83, column: 40, scope: !105)
!119 = !DILocation(line: 85, column: 35, scope: !105)
!120 = !DILocation(line: 85, column: 51, scope: !105)
!121 = !DILocation(line: 85, column: 24, scope: !105)
!122 = !DILocation(line: 85, column: 13, scope: !105)
!123 = !DILocation(line: 87, column: 20, scope: !105)
!124 = !DILocation(line: 87, column: 36, scope: !105)
!125 = !DILocation(line: 87, column: 13, scope: !105)
!126 = !DILocation(line: 88, column: 13, scope: !105)
!127 = !DILocation(line: 88, column: 29, scope: !105)
!128 = !DILocation(line: 88, column: 94, scope: !105)
!129 = !DILocation(line: 89, column: 35, scope: !105)
!130 = !DILocation(line: 89, column: 51, scope: !105)
!131 = !DILocation(line: 89, column: 13, scope: !105)
!132 = !DILocation(line: 90, column: 35, scope: !105)
!133 = !DILocation(line: 90, column: 51, scope: !105)
!134 = !DILocation(line: 90, column: 24, scope: !105)
!135 = !DILocation(line: 90, column: 13, scope: !105)
!136 = !DILocation(line: 91, column: 18, scope: !105)
!137 = !DILocation(line: 91, column: 13, scope: !105)
!138 = !DILocation(line: 94, column: 1, scope: !97)
!139 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !6, file: !6, line: 39, type: !94, scopeLine: 40, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!140 = !DILocation(line: 41, column: 5, scope: !139)
!141 = distinct !DISubprogram(name: "good2", scope: !6, file: !6, line: 97, type: !28, scopeLine: 98, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!142 = !DILocation(line: 99, column: 8, scope: !143)
!143 = distinct !DILexicalBlock(scope: !141, file: !6, line: 99, column: 8)
!144 = !DILocation(line: 99, column: 8, scope: !141)
!145 = !DILocalVariable(name: "structCharVoid", scope: !146, file: !6, line: 102, type: !4)
!146 = distinct !DILexicalBlock(scope: !147, file: !6, line: 101, column: 9)
!147 = distinct !DILexicalBlock(scope: !143, file: !6, line: 100, column: 5)
!148 = !DILocation(line: 102, column: 24, scope: !146)
!149 = !DILocation(line: 102, column: 53, scope: !146)
!150 = !DILocation(line: 102, column: 41, scope: !146)
!151 = !DILocation(line: 103, column: 17, scope: !152)
!152 = distinct !DILexicalBlock(scope: !146, file: !6, line: 103, column: 17)
!153 = !DILocation(line: 103, column: 32, scope: !152)
!154 = !DILocation(line: 103, column: 17, scope: !146)
!155 = !DILocation(line: 103, column: 42, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !6, line: 103, column: 41)
!157 = !DILocation(line: 104, column: 13, scope: !146)
!158 = !DILocation(line: 104, column: 29, scope: !146)
!159 = !DILocation(line: 104, column: 40, scope: !146)
!160 = !DILocation(line: 106, column: 35, scope: !146)
!161 = !DILocation(line: 106, column: 51, scope: !146)
!162 = !DILocation(line: 106, column: 24, scope: !146)
!163 = !DILocation(line: 106, column: 13, scope: !146)
!164 = !DILocation(line: 108, column: 20, scope: !146)
!165 = !DILocation(line: 108, column: 36, scope: !146)
!166 = !DILocation(line: 108, column: 13, scope: !146)
!167 = !DILocation(line: 109, column: 13, scope: !146)
!168 = !DILocation(line: 109, column: 29, scope: !146)
!169 = !DILocation(line: 109, column: 94, scope: !146)
!170 = !DILocation(line: 110, column: 35, scope: !146)
!171 = !DILocation(line: 110, column: 51, scope: !146)
!172 = !DILocation(line: 110, column: 13, scope: !146)
!173 = !DILocation(line: 111, column: 35, scope: !146)
!174 = !DILocation(line: 111, column: 51, scope: !146)
!175 = !DILocation(line: 111, column: 24, scope: !146)
!176 = !DILocation(line: 111, column: 13, scope: !146)
!177 = !DILocation(line: 112, column: 18, scope: !146)
!178 = !DILocation(line: 112, column: 13, scope: !146)
!179 = !DILocation(line: 114, column: 5, scope: !147)
!180 = !DILocation(line: 115, column: 1, scope: !141)
