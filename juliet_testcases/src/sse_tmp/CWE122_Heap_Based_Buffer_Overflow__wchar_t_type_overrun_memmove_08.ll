; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_08.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_08.c"
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_08_bad() #0 !dbg !27 {
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
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 80, i1 false), !dbg !54
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
  br label %if.end8, !dbg !65

if.end8:                                          ; preds = %if.end, %entry
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_08_good() #0 !dbg !67 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_08_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !87
  call void @CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_08_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !91 {
entry:
  ret i32 1, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !95 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %call = call i32 @staticReturnsFalse(), !dbg !96
  %tobool = icmp ne i32 %call, 0, !dbg !96
  br i1 %tobool, label %if.then, label %if.else, !dbg !98

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !99
  br label %if.end8, !dbg !101

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !102, metadata !DIExpression()), !dbg !105
  %call1 = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !106
  %0 = bitcast i8* %call1 to %struct._charVoid*, !dbg !107
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !105
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !108
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !110
  br i1 %cmp, label %if.then2, label %if.end, !dbg !111

if.then2:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !112
  unreachable, !dbg !112

if.end:                                           ; preds = %if.else
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !114
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !115
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !116
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !117
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !118
  %4 = load i8*, i8** %voidSecond3, align 8, !dbg !118
  %5 = bitcast i8* %4 to i32*, !dbg !119
  call void @printWLine(i32* %5), !dbg !120
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !121
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !122
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !123
  %7 = bitcast i32* %arraydecay to i8*, !dbg !123
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !123
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !124
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !125
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 15, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !126
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !127
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !128
  %arraydecay6 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst5, i64 0, i64 0, !dbg !127
  call void @printWLine(i32* %arraydecay6), !dbg !129
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !130
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 1, !dbg !131
  %11 = load i8*, i8** %voidSecond7, align 8, !dbg !131
  %12 = bitcast i8* %11 to i32*, !dbg !132
  call void @printWLine(i32* %12), !dbg !133
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  ret void, !dbg !134
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !135 {
entry:
  ret i32 0, !dbg !136
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !137 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %call = call i32 @staticReturnsTrue(), !dbg !138
  %tobool = icmp ne i32 %call, 0, !dbg !138
  br i1 %tobool, label %if.then, label %if.end8, !dbg !140

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !141, metadata !DIExpression()), !dbg !144
  %call1 = call noalias align 16 i8* @malloc(i64 80) #6, !dbg !145
  %0 = bitcast i8* %call1 to %struct._charVoid*, !dbg !146
  store %struct._charVoid* %0, %struct._charVoid** %structCharVoid, align 8, !dbg !144
  %1 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !147
  %cmp = icmp eq %struct._charVoid* %1, null, !dbg !149
  br i1 %cmp, label %if.then2, label %if.end, !dbg !150

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !151
  unreachable, !dbg !151

if.end:                                           ; preds = %if.then
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !153
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %2, i32 0, i32 1, !dbg !154
  store i8* bitcast ([32 x i32]* @.str to i8*), i8** %voidSecond, align 8, !dbg !155
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !156
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !157
  %4 = load i8*, i8** %voidSecond3, align 8, !dbg !157
  %5 = bitcast i8* %4 to i32*, !dbg !158
  call void @printWLine(i32* %5), !dbg !159
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !160
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !161
  %arraydecay = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst, i64 0, i64 0, !dbg !162
  %7 = bitcast i32* %arraydecay to i8*, !dbg !162
  call void @llvm.memmove.p0i8.p0i8.i64(i8* align 8 %7, i8* align 4 bitcast ([32 x i32]* @.str to i8*), i64 64, i1 false), !dbg !162
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !163
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !164
  %arrayidx = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst4, i64 0, i64 15, !dbg !163
  store i32 0, i32* %arrayidx, align 4, !dbg !165
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !166
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 0, !dbg !167
  %arraydecay6 = getelementptr inbounds [16 x i32], [16 x i32]* %charFirst5, i64 0, i64 0, !dbg !166
  call void @printWLine(i32* %arraydecay6), !dbg !168
  %10 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !169
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %10, i32 0, i32 1, !dbg !170
  %11 = load i8*, i8** %voidSecond7, align 8, !dbg !170
  %12 = bitcast i8* %11 to i32*, !dbg !171
  call void @printWLine(i32* %12), !dbg !172
  br label %if.end8, !dbg !173

if.end8:                                          ; preds = %if.end, %entry
  ret void, !dbg !174
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !17, !19, !20}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !6, line: 29, baseType: !7)
!6 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_08.c", directory: "/root/SSE-Assessment")
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
!27 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_08_bad", scope: !6, file: !6, line: 46, type: !28, scopeLine: 47, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
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
!52 = !DILocation(line: 57, column: 21, scope: !34)
!53 = !DILocation(line: 57, column: 37, scope: !34)
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
!65 = !DILocation(line: 62, column: 5, scope: !35)
!66 = !DILocation(line: 63, column: 1, scope: !27)
!67 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__wchar_t_type_overrun_memmove_08_good", scope: !6, file: !6, line: 114, type: !28, scopeLine: 115, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!68 = !DILocation(line: 116, column: 5, scope: !67)
!69 = !DILocation(line: 117, column: 5, scope: !67)
!70 = !DILocation(line: 118, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "main", scope: !6, file: !6, line: 129, type: !72, scopeLine: 130, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DISubroutineType(types: !73)
!73 = !{!13, !13, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !6, line: 129, type: !13)
!78 = !DILocation(line: 129, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !6, line: 129, type: !74)
!80 = !DILocation(line: 129, column: 27, scope: !71)
!81 = !DILocation(line: 132, column: 22, scope: !71)
!82 = !DILocation(line: 132, column: 12, scope: !71)
!83 = !DILocation(line: 132, column: 5, scope: !71)
!84 = !DILocation(line: 134, column: 5, scope: !71)
!85 = !DILocation(line: 135, column: 5, scope: !71)
!86 = !DILocation(line: 136, column: 5, scope: !71)
!87 = !DILocation(line: 139, column: 5, scope: !71)
!88 = !DILocation(line: 140, column: 5, scope: !71)
!89 = !DILocation(line: 141, column: 5, scope: !71)
!90 = !DILocation(line: 143, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !6, file: !6, line: 34, type: !92, scopeLine: 35, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!92 = !DISubroutineType(types: !93)
!93 = !{!13}
!94 = !DILocation(line: 36, column: 5, scope: !91)
!95 = distinct !DISubprogram(name: "good1", scope: !6, file: !6, line: 70, type: !28, scopeLine: 71, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocation(line: 72, column: 8, scope: !97)
!97 = distinct !DILexicalBlock(scope: !95, file: !6, line: 72, column: 8)
!98 = !DILocation(line: 72, column: 8, scope: !95)
!99 = !DILocation(line: 75, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !97, file: !6, line: 73, column: 5)
!101 = !DILocation(line: 76, column: 5, scope: !100)
!102 = !DILocalVariable(name: "structCharVoid", scope: !103, file: !6, line: 80, type: !4)
!103 = distinct !DILexicalBlock(scope: !104, file: !6, line: 79, column: 9)
!104 = distinct !DILexicalBlock(scope: !97, file: !6, line: 78, column: 5)
!105 = !DILocation(line: 80, column: 24, scope: !103)
!106 = !DILocation(line: 80, column: 53, scope: !103)
!107 = !DILocation(line: 80, column: 41, scope: !103)
!108 = !DILocation(line: 81, column: 17, scope: !109)
!109 = distinct !DILexicalBlock(scope: !103, file: !6, line: 81, column: 17)
!110 = !DILocation(line: 81, column: 32, scope: !109)
!111 = !DILocation(line: 81, column: 17, scope: !103)
!112 = !DILocation(line: 81, column: 42, scope: !113)
!113 = distinct !DILexicalBlock(scope: !109, file: !6, line: 81, column: 41)
!114 = !DILocation(line: 82, column: 13, scope: !103)
!115 = !DILocation(line: 82, column: 29, scope: !103)
!116 = !DILocation(line: 82, column: 40, scope: !103)
!117 = !DILocation(line: 84, column: 35, scope: !103)
!118 = !DILocation(line: 84, column: 51, scope: !103)
!119 = !DILocation(line: 84, column: 24, scope: !103)
!120 = !DILocation(line: 84, column: 13, scope: !103)
!121 = !DILocation(line: 86, column: 21, scope: !103)
!122 = !DILocation(line: 86, column: 37, scope: !103)
!123 = !DILocation(line: 86, column: 13, scope: !103)
!124 = !DILocation(line: 87, column: 13, scope: !103)
!125 = !DILocation(line: 87, column: 29, scope: !103)
!126 = !DILocation(line: 87, column: 94, scope: !103)
!127 = !DILocation(line: 88, column: 35, scope: !103)
!128 = !DILocation(line: 88, column: 51, scope: !103)
!129 = !DILocation(line: 88, column: 13, scope: !103)
!130 = !DILocation(line: 89, column: 35, scope: !103)
!131 = !DILocation(line: 89, column: 51, scope: !103)
!132 = !DILocation(line: 89, column: 24, scope: !103)
!133 = !DILocation(line: 89, column: 13, scope: !103)
!134 = !DILocation(line: 92, column: 1, scope: !95)
!135 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !6, file: !6, line: 39, type: !92, scopeLine: 40, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!136 = !DILocation(line: 41, column: 5, scope: !135)
!137 = distinct !DISubprogram(name: "good2", scope: !6, file: !6, line: 95, type: !28, scopeLine: 96, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!138 = !DILocation(line: 97, column: 8, scope: !139)
!139 = distinct !DILexicalBlock(scope: !137, file: !6, line: 97, column: 8)
!140 = !DILocation(line: 97, column: 8, scope: !137)
!141 = !DILocalVariable(name: "structCharVoid", scope: !142, file: !6, line: 100, type: !4)
!142 = distinct !DILexicalBlock(scope: !143, file: !6, line: 99, column: 9)
!143 = distinct !DILexicalBlock(scope: !139, file: !6, line: 98, column: 5)
!144 = !DILocation(line: 100, column: 24, scope: !142)
!145 = !DILocation(line: 100, column: 53, scope: !142)
!146 = !DILocation(line: 100, column: 41, scope: !142)
!147 = !DILocation(line: 101, column: 17, scope: !148)
!148 = distinct !DILexicalBlock(scope: !142, file: !6, line: 101, column: 17)
!149 = !DILocation(line: 101, column: 32, scope: !148)
!150 = !DILocation(line: 101, column: 17, scope: !142)
!151 = !DILocation(line: 101, column: 42, scope: !152)
!152 = distinct !DILexicalBlock(scope: !148, file: !6, line: 101, column: 41)
!153 = !DILocation(line: 102, column: 13, scope: !142)
!154 = !DILocation(line: 102, column: 29, scope: !142)
!155 = !DILocation(line: 102, column: 40, scope: !142)
!156 = !DILocation(line: 104, column: 35, scope: !142)
!157 = !DILocation(line: 104, column: 51, scope: !142)
!158 = !DILocation(line: 104, column: 24, scope: !142)
!159 = !DILocation(line: 104, column: 13, scope: !142)
!160 = !DILocation(line: 106, column: 21, scope: !142)
!161 = !DILocation(line: 106, column: 37, scope: !142)
!162 = !DILocation(line: 106, column: 13, scope: !142)
!163 = !DILocation(line: 107, column: 13, scope: !142)
!164 = !DILocation(line: 107, column: 29, scope: !142)
!165 = !DILocation(line: 107, column: 94, scope: !142)
!166 = !DILocation(line: 108, column: 35, scope: !142)
!167 = !DILocation(line: 108, column: 51, scope: !142)
!168 = !DILocation(line: 108, column: 13, scope: !142)
!169 = !DILocation(line: 109, column: 35, scope: !142)
!170 = !DILocation(line: 109, column: 51, scope: !142)
!171 = !DILocation(line: 109, column: 24, scope: !142)
!172 = !DILocation(line: 109, column: 13, scope: !142)
!173 = !DILocation(line: 111, column: 5, scope: !143)
!174 = !DILocation(line: 112, column: 1, scope: !137)
