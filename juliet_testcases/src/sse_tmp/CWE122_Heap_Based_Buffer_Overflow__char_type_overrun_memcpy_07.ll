; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_07_bad() #0 !dbg !29 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticFive, align 4, !dbg !32
  %cmp = icmp eq i32 %0, 5, !dbg !34
  br i1 %cmp, label %if.then, label %if.end8, !dbg !35

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !36, metadata !DIExpression()), !dbg !39
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !40
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !41
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !39
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !42
  %cmp1 = icmp eq %struct._charVoid* %2, null, !dbg !44
  br i1 %cmp1, label %if.then2, label %if.end, !dbg !45

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !46
  unreachable, !dbg !46

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !48
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !49
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !50
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !51
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !52
  %5 = load i8*, i8** %voidSecond3, align 8, !dbg !52
  call void @printLine(i8* %5), !dbg !53
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !54
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !55
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !56
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !56
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !57
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !58
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 15, !dbg !57
  store i8 0, i8* %arrayidx, align 1, !dbg !59
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !60
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !61
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst5, i64 0, i64 0, !dbg !60
  call void @printLine(i8* %arraydecay6), !dbg !62
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !63
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 1, !dbg !64
  %10 = load i8*, i8** %voidSecond7, align 8, !dbg !64
  call void @printLine(i8* %10), !dbg !65
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !66
  %12 = bitcast %struct._charVoid* %11 to i8*, !dbg !66
  call void @free(i8* %12) #6, !dbg !67
  br label %if.end8, !dbg !68

if.end8:                                          ; preds = %if.end, %entry
  ret void, !dbg !69
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_07_good() #0 !dbg !70 {
entry:
  call void @good1(), !dbg !71
  call void @good2(), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !74 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_07_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_07_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !92 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticFive, align 4, !dbg !93
  %cmp = icmp ne i32 %0, 5, !dbg !95
  br i1 %cmp, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !97
  br label %if.end8, !dbg !99

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !100, metadata !DIExpression()), !dbg !103
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !104
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
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !114
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !115
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !116
  %5 = load i8*, i8** %voidSecond3, align 8, !dbg !116
  call void @printLine(i8* %5), !dbg !117
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !118
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !119
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !120
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !121
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !122
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 15, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !123
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !124
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !125
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst5, i64 0, i64 0, !dbg !124
  call void @printLine(i8* %arraydecay6), !dbg !126
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !127
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 1, !dbg !128
  %10 = load i8*, i8** %voidSecond7, align 8, !dbg !128
  call void @printLine(i8* %10), !dbg !129
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !130
  %12 = bitcast %struct._charVoid* %11 to i8*, !dbg !130
  call void @free(i8* %12) #6, !dbg !131
  br label %if.end8

if.end8:                                          ; preds = %if.end, %if.then
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !133 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticFive, align 4, !dbg !134
  %cmp = icmp eq i32 %0, 5, !dbg !136
  br i1 %cmp, label %if.then, label %if.end8, !dbg !137

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !138, metadata !DIExpression()), !dbg !141
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !142
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
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !152
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !153
  %voidSecond3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !154
  %5 = load i8*, i8** %voidSecond3, align 8, !dbg !154
  call void @printLine(i8* %5), !dbg !155
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !156
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !157
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !158
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !158
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !159
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !160
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 15, !dbg !159
  store i8 0, i8* %arrayidx, align 1, !dbg !161
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !162
  %charFirst5 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !163
  %arraydecay6 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst5, i64 0, i64 0, !dbg !162
  call void @printLine(i8* %arraydecay6), !dbg !164
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !165
  %voidSecond7 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 1, !dbg !166
  %10 = load i8*, i8** %voidSecond7, align 8, !dbg !166
  call void @printLine(i8* %10), !dbg !167
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !168
  %12 = bitcast %struct._charVoid* %11 to i8*, !dbg !168
  call void @free(i8* %12) #6, !dbg !169
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

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!23, !24, !25, !26, !27}
!llvm.ident = !{!28}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 34, type: !22, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !21, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !17, !19, !20}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !8, line: 29, baseType: !9)
!8 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_charVoid", file: !8, line: 24, size: 256, elements: !10)
!10 = !{!11, !16, !18}
!11 = !DIDerivedType(tag: DW_TAG_member, name: "charFirst", scope: !9, file: !8, line: 26, baseType: !12, size: 128)
!12 = !DICompositeType(tag: DW_TAG_array_type, baseType: !13, size: 128, elements: !14)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !{!15}
!15 = !DISubrange(count: 16)
!16 = !DIDerivedType(tag: DW_TAG_member, name: "voidSecond", scope: !9, file: !8, line: 27, baseType: !17, size: 64, offset: 128)
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!18 = !DIDerivedType(tag: DW_TAG_member, name: "voidThird", scope: !9, file: !8, line: 28, baseType: !17, size: 64, offset: 192)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!20 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!21 = !{!0}
!22 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!23 = !{i32 7, !"Dwarf Version", i32 4}
!24 = !{i32 2, !"Debug Info Version", i32 3}
!25 = !{i32 1, !"wchar_size", i32 4}
!26 = !{i32 7, !"uwtable", i32 1}
!27 = !{i32 7, !"frame-pointer", i32 2}
!28 = !{!"clang version 13.0.0"}
!29 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_07_bad", scope: !8, file: !8, line: 38, type: !30, scopeLine: 39, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!30 = !DISubroutineType(types: !31)
!31 = !{null}
!32 = !DILocation(line: 40, column: 8, scope: !33)
!33 = distinct !DILexicalBlock(scope: !29, file: !8, line: 40, column: 8)
!34 = !DILocation(line: 40, column: 18, scope: !33)
!35 = !DILocation(line: 40, column: 8, scope: !29)
!36 = !DILocalVariable(name: "structCharVoid", scope: !37, file: !8, line: 43, type: !6)
!37 = distinct !DILexicalBlock(scope: !38, file: !8, line: 42, column: 9)
!38 = distinct !DILexicalBlock(scope: !33, file: !8, line: 41, column: 5)
!39 = !DILocation(line: 43, column: 24, scope: !37)
!40 = !DILocation(line: 43, column: 53, scope: !37)
!41 = !DILocation(line: 43, column: 41, scope: !37)
!42 = !DILocation(line: 44, column: 17, scope: !43)
!43 = distinct !DILexicalBlock(scope: !37, file: !8, line: 44, column: 17)
!44 = !DILocation(line: 44, column: 32, scope: !43)
!45 = !DILocation(line: 44, column: 17, scope: !37)
!46 = !DILocation(line: 44, column: 42, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !8, line: 44, column: 41)
!48 = !DILocation(line: 45, column: 13, scope: !37)
!49 = !DILocation(line: 45, column: 29, scope: !37)
!50 = !DILocation(line: 45, column: 40, scope: !37)
!51 = !DILocation(line: 47, column: 31, scope: !37)
!52 = !DILocation(line: 47, column: 47, scope: !37)
!53 = !DILocation(line: 47, column: 13, scope: !37)
!54 = !DILocation(line: 49, column: 20, scope: !37)
!55 = !DILocation(line: 49, column: 36, scope: !37)
!56 = !DILocation(line: 49, column: 13, scope: !37)
!57 = !DILocation(line: 50, column: 13, scope: !37)
!58 = !DILocation(line: 50, column: 29, scope: !37)
!59 = !DILocation(line: 50, column: 91, scope: !37)
!60 = !DILocation(line: 51, column: 31, scope: !37)
!61 = !DILocation(line: 51, column: 47, scope: !37)
!62 = !DILocation(line: 51, column: 13, scope: !37)
!63 = !DILocation(line: 52, column: 31, scope: !37)
!64 = !DILocation(line: 52, column: 47, scope: !37)
!65 = !DILocation(line: 52, column: 13, scope: !37)
!66 = !DILocation(line: 53, column: 18, scope: !37)
!67 = !DILocation(line: 53, column: 13, scope: !37)
!68 = !DILocation(line: 55, column: 5, scope: !38)
!69 = !DILocation(line: 56, column: 1, scope: !29)
!70 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_07_good", scope: !8, file: !8, line: 109, type: !30, scopeLine: 110, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DILocation(line: 111, column: 5, scope: !70)
!72 = !DILocation(line: 112, column: 5, scope: !70)
!73 = !DILocation(line: 113, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 124, type: !75, scopeLine: 125, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DISubroutineType(types: !76)
!76 = !{!22, !22, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !8, line: 124, type: !22)
!79 = !DILocation(line: 124, column: 14, scope: !74)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !8, line: 124, type: !77)
!81 = !DILocation(line: 124, column: 27, scope: !74)
!82 = !DILocation(line: 127, column: 22, scope: !74)
!83 = !DILocation(line: 127, column: 12, scope: !74)
!84 = !DILocation(line: 127, column: 5, scope: !74)
!85 = !DILocation(line: 129, column: 5, scope: !74)
!86 = !DILocation(line: 130, column: 5, scope: !74)
!87 = !DILocation(line: 131, column: 5, scope: !74)
!88 = !DILocation(line: 134, column: 5, scope: !74)
!89 = !DILocation(line: 135, column: 5, scope: !74)
!90 = !DILocation(line: 136, column: 5, scope: !74)
!91 = !DILocation(line: 138, column: 5, scope: !74)
!92 = distinct !DISubprogram(name: "good1", scope: !8, file: !8, line: 63, type: !30, scopeLine: 64, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocation(line: 65, column: 8, scope: !94)
!94 = distinct !DILexicalBlock(scope: !92, file: !8, line: 65, column: 8)
!95 = !DILocation(line: 65, column: 18, scope: !94)
!96 = !DILocation(line: 65, column: 8, scope: !92)
!97 = !DILocation(line: 68, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !94, file: !8, line: 66, column: 5)
!99 = !DILocation(line: 69, column: 5, scope: !98)
!100 = !DILocalVariable(name: "structCharVoid", scope: !101, file: !8, line: 73, type: !6)
!101 = distinct !DILexicalBlock(scope: !102, file: !8, line: 72, column: 9)
!102 = distinct !DILexicalBlock(scope: !94, file: !8, line: 71, column: 5)
!103 = !DILocation(line: 73, column: 24, scope: !101)
!104 = !DILocation(line: 73, column: 53, scope: !101)
!105 = !DILocation(line: 73, column: 41, scope: !101)
!106 = !DILocation(line: 74, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !101, file: !8, line: 74, column: 17)
!108 = !DILocation(line: 74, column: 32, scope: !107)
!109 = !DILocation(line: 74, column: 17, scope: !101)
!110 = !DILocation(line: 74, column: 42, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !8, line: 74, column: 41)
!112 = !DILocation(line: 75, column: 13, scope: !101)
!113 = !DILocation(line: 75, column: 29, scope: !101)
!114 = !DILocation(line: 75, column: 40, scope: !101)
!115 = !DILocation(line: 77, column: 31, scope: !101)
!116 = !DILocation(line: 77, column: 47, scope: !101)
!117 = !DILocation(line: 77, column: 13, scope: !101)
!118 = !DILocation(line: 79, column: 20, scope: !101)
!119 = !DILocation(line: 79, column: 36, scope: !101)
!120 = !DILocation(line: 79, column: 13, scope: !101)
!121 = !DILocation(line: 80, column: 13, scope: !101)
!122 = !DILocation(line: 80, column: 29, scope: !101)
!123 = !DILocation(line: 80, column: 91, scope: !101)
!124 = !DILocation(line: 81, column: 31, scope: !101)
!125 = !DILocation(line: 81, column: 47, scope: !101)
!126 = !DILocation(line: 81, column: 13, scope: !101)
!127 = !DILocation(line: 82, column: 31, scope: !101)
!128 = !DILocation(line: 82, column: 47, scope: !101)
!129 = !DILocation(line: 82, column: 13, scope: !101)
!130 = !DILocation(line: 83, column: 18, scope: !101)
!131 = !DILocation(line: 83, column: 13, scope: !101)
!132 = !DILocation(line: 86, column: 1, scope: !92)
!133 = distinct !DISubprogram(name: "good2", scope: !8, file: !8, line: 89, type: !30, scopeLine: 90, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!134 = !DILocation(line: 91, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !133, file: !8, line: 91, column: 8)
!136 = !DILocation(line: 91, column: 18, scope: !135)
!137 = !DILocation(line: 91, column: 8, scope: !133)
!138 = !DILocalVariable(name: "structCharVoid", scope: !139, file: !8, line: 94, type: !6)
!139 = distinct !DILexicalBlock(scope: !140, file: !8, line: 93, column: 9)
!140 = distinct !DILexicalBlock(scope: !135, file: !8, line: 92, column: 5)
!141 = !DILocation(line: 94, column: 24, scope: !139)
!142 = !DILocation(line: 94, column: 53, scope: !139)
!143 = !DILocation(line: 94, column: 41, scope: !139)
!144 = !DILocation(line: 95, column: 17, scope: !145)
!145 = distinct !DILexicalBlock(scope: !139, file: !8, line: 95, column: 17)
!146 = !DILocation(line: 95, column: 32, scope: !145)
!147 = !DILocation(line: 95, column: 17, scope: !139)
!148 = !DILocation(line: 95, column: 42, scope: !149)
!149 = distinct !DILexicalBlock(scope: !145, file: !8, line: 95, column: 41)
!150 = !DILocation(line: 96, column: 13, scope: !139)
!151 = !DILocation(line: 96, column: 29, scope: !139)
!152 = !DILocation(line: 96, column: 40, scope: !139)
!153 = !DILocation(line: 98, column: 31, scope: !139)
!154 = !DILocation(line: 98, column: 47, scope: !139)
!155 = !DILocation(line: 98, column: 13, scope: !139)
!156 = !DILocation(line: 100, column: 20, scope: !139)
!157 = !DILocation(line: 100, column: 36, scope: !139)
!158 = !DILocation(line: 100, column: 13, scope: !139)
!159 = !DILocation(line: 101, column: 13, scope: !139)
!160 = !DILocation(line: 101, column: 29, scope: !139)
!161 = !DILocation(line: 101, column: 91, scope: !139)
!162 = !DILocation(line: 102, column: 31, scope: !139)
!163 = !DILocation(line: 102, column: 47, scope: !139)
!164 = !DILocation(line: 102, column: 13, scope: !139)
!165 = !DILocation(line: 103, column: 31, scope: !139)
!166 = !DILocation(line: 103, column: 47, scope: !139)
!167 = !DILocation(line: 103, column: 13, scope: !139)
!168 = !DILocation(line: 104, column: 18, scope: !139)
!169 = !DILocation(line: 104, column: 13, scope: !139)
!170 = !DILocation(line: 106, column: 5, scope: !140)
!171 = !DILocation(line: 107, column: 1, scope: !133)
