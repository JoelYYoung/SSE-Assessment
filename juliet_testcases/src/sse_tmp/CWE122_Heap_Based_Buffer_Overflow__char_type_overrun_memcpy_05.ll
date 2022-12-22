; ModuleID = './juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_05.c'
source_filename = "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_05.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._charVoid = type { [16 x i8], i8*, i8* }

@staticTrue = internal global i32 1, align 4, !dbg !0
@.str = private unnamed_addr constant [32 x i8] c"0123456789abcdef0123456789abcde\00", align 1
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@staticFalse = internal global i32 0, align 4, !dbg !22
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_05_bad() #0 !dbg !31 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticTrue, align 4, !dbg !34
  %tobool = icmp ne i32 %0, 0, !dbg !34
  br i1 %tobool, label %if.then, label %if.end7, !dbg !36

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !37, metadata !DIExpression()), !dbg !40
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !41
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !42
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !40
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !43
  %cmp = icmp eq %struct._charVoid* %2, null, !dbg !45
  br i1 %cmp, label %if.then1, label %if.end, !dbg !46

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !47
  unreachable, !dbg !47

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !49
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !50
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !51
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !52
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !53
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !53
  call void @printLine(i8* %5), !dbg !54
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !55
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !56
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !57
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 32, i1 false), !dbg !57
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !58
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !59
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 15, !dbg !58
  store i8 0, i8* %arrayidx, align 1, !dbg !60
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !61
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !62
  %arraydecay5 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 0, !dbg !61
  call void @printLine(i8* %arraydecay5), !dbg !63
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !64
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 1, !dbg !65
  %10 = load i8*, i8** %voidSecond6, align 8, !dbg !65
  call void @printLine(i8* %10), !dbg !66
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !67
  %12 = bitcast %struct._charVoid* %11 to i8*, !dbg !67
  call void @free(i8* %12) #6, !dbg !68
  br label %if.end7, !dbg !69

if.end7:                                          ; preds = %if.end, %entry
  ret void, !dbg !70
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
define dso_local void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_05_good() #0 !dbg !71 {
entry:
  call void @good1(), !dbg !72
  call void @good2(), !dbg !73
  ret void, !dbg !74
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !75 {
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
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_05_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  call void @CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_05_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @good1() #0 !dbg !93 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticFalse, align 4, !dbg !94
  %tobool = icmp ne i32 %0, 0, !dbg !94
  br i1 %tobool, label %if.then, label %if.else, !dbg !96

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !97
  br label %if.end7, !dbg !99

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !100, metadata !DIExpression()), !dbg !103
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !104
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !105
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !103
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !106
  %cmp = icmp eq %struct._charVoid* %2, null, !dbg !108
  br i1 %cmp, label %if.then1, label %if.end, !dbg !109

if.then1:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !110
  unreachable, !dbg !110

if.end:                                           ; preds = %if.else
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !112
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !113
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !114
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !115
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !116
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !116
  call void @printLine(i8* %5), !dbg !117
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !118
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !119
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !120
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !120
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !121
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !122
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 15, !dbg !121
  store i8 0, i8* %arrayidx, align 1, !dbg !123
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !124
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !125
  %arraydecay5 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 0, !dbg !124
  call void @printLine(i8* %arraydecay5), !dbg !126
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !127
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 1, !dbg !128
  %10 = load i8*, i8** %voidSecond6, align 8, !dbg !128
  call void @printLine(i8* %10), !dbg !129
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !130
  %12 = bitcast %struct._charVoid* %11 to i8*, !dbg !130
  call void @free(i8* %12) #6, !dbg !131
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define internal void @good2() #0 !dbg !133 {
entry:
  %structCharVoid = alloca %struct._charVoid*, align 8
  %0 = load i32, i32* @staticTrue, align 4, !dbg !134
  %tobool = icmp ne i32 %0, 0, !dbg !134
  br i1 %tobool, label %if.then, label %if.end7, !dbg !136

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct._charVoid** %structCharVoid, metadata !137, metadata !DIExpression()), !dbg !140
  %call = call noalias align 16 i8* @malloc(i64 32) #6, !dbg !141
  %1 = bitcast i8* %call to %struct._charVoid*, !dbg !142
  store %struct._charVoid* %1, %struct._charVoid** %structCharVoid, align 8, !dbg !140
  %2 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !143
  %cmp = icmp eq %struct._charVoid* %2, null, !dbg !145
  br i1 %cmp, label %if.then1, label %if.end, !dbg !146

if.then1:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !147
  unreachable, !dbg !147

if.end:                                           ; preds = %if.then
  %3 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !149
  %voidSecond = getelementptr inbounds %struct._charVoid, %struct._charVoid* %3, i32 0, i32 1, !dbg !150
  store i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i8** %voidSecond, align 8, !dbg !151
  %4 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !152
  %voidSecond2 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %4, i32 0, i32 1, !dbg !153
  %5 = load i8*, i8** %voidSecond2, align 8, !dbg !153
  call void @printLine(i8* %5), !dbg !154
  %6 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !155
  %charFirst = getelementptr inbounds %struct._charVoid, %struct._charVoid* %6, i32 0, i32 0, !dbg !156
  %arraydecay = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst, i64 0, i64 0, !dbg !157
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %arraydecay, i8* align 1 getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i64 16, i1 false), !dbg !157
  %7 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !158
  %charFirst3 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %7, i32 0, i32 0, !dbg !159
  %arrayidx = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst3, i64 0, i64 15, !dbg !158
  store i8 0, i8* %arrayidx, align 1, !dbg !160
  %8 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !161
  %charFirst4 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %8, i32 0, i32 0, !dbg !162
  %arraydecay5 = getelementptr inbounds [16 x i8], [16 x i8]* %charFirst4, i64 0, i64 0, !dbg !161
  call void @printLine(i8* %arraydecay5), !dbg !163
  %9 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !164
  %voidSecond6 = getelementptr inbounds %struct._charVoid, %struct._charVoid* %9, i32 0, i32 1, !dbg !165
  %10 = load i8*, i8** %voidSecond6, align 8, !dbg !165
  call void @printLine(i8* %10), !dbg !166
  %11 = load %struct._charVoid*, %struct._charVoid** %structCharVoid, align 8, !dbg !167
  %12 = bitcast %struct._charVoid* %11 to i8*, !dbg !167
  call void @free(i8* %12) #6, !dbg !168
  br label %if.end7, !dbg !169

if.end7:                                          ; preds = %if.end, %entry
  ret void, !dbg !170
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
!llvm.module.flags = !{!25, !26, !27, !28, !29}
!llvm.ident = !{!30}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticTrue", scope: !2, file: !8, line: 34, type: !24, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !21, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_05.c", directory: "/root/SSE-Assessment")
!4 = !{}
!5 = !{!6, !17, !19, !20}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "charVoid", file: !8, line: 29, baseType: !9)
!8 = !DIFile(filename: "./juliet_testcases/src/CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_05.c", directory: "/root/SSE-Assessment")
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
!21 = !{!0, !22}
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(name: "staticFalse", scope: !2, file: !8, line: 35, type: !24, isLocal: true, isDefinition: true)
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !{i32 7, !"Dwarf Version", i32 4}
!26 = !{i32 2, !"Debug Info Version", i32 3}
!27 = !{i32 1, !"wchar_size", i32 4}
!28 = !{i32 7, !"uwtable", i32 1}
!29 = !{i32 7, !"frame-pointer", i32 2}
!30 = !{!"clang version 13.0.0"}
!31 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_05_bad", scope: !8, file: !8, line: 39, type: !32, scopeLine: 40, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!32 = !DISubroutineType(types: !33)
!33 = !{null}
!34 = !DILocation(line: 41, column: 8, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !8, line: 41, column: 8)
!36 = !DILocation(line: 41, column: 8, scope: !31)
!37 = !DILocalVariable(name: "structCharVoid", scope: !38, file: !8, line: 44, type: !6)
!38 = distinct !DILexicalBlock(scope: !39, file: !8, line: 43, column: 9)
!39 = distinct !DILexicalBlock(scope: !35, file: !8, line: 42, column: 5)
!40 = !DILocation(line: 44, column: 24, scope: !38)
!41 = !DILocation(line: 44, column: 53, scope: !38)
!42 = !DILocation(line: 44, column: 41, scope: !38)
!43 = !DILocation(line: 45, column: 17, scope: !44)
!44 = distinct !DILexicalBlock(scope: !38, file: !8, line: 45, column: 17)
!45 = !DILocation(line: 45, column: 32, scope: !44)
!46 = !DILocation(line: 45, column: 17, scope: !38)
!47 = !DILocation(line: 45, column: 42, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !8, line: 45, column: 41)
!49 = !DILocation(line: 46, column: 13, scope: !38)
!50 = !DILocation(line: 46, column: 29, scope: !38)
!51 = !DILocation(line: 46, column: 40, scope: !38)
!52 = !DILocation(line: 48, column: 31, scope: !38)
!53 = !DILocation(line: 48, column: 47, scope: !38)
!54 = !DILocation(line: 48, column: 13, scope: !38)
!55 = !DILocation(line: 50, column: 20, scope: !38)
!56 = !DILocation(line: 50, column: 36, scope: !38)
!57 = !DILocation(line: 50, column: 13, scope: !38)
!58 = !DILocation(line: 51, column: 13, scope: !38)
!59 = !DILocation(line: 51, column: 29, scope: !38)
!60 = !DILocation(line: 51, column: 91, scope: !38)
!61 = !DILocation(line: 52, column: 31, scope: !38)
!62 = !DILocation(line: 52, column: 47, scope: !38)
!63 = !DILocation(line: 52, column: 13, scope: !38)
!64 = !DILocation(line: 53, column: 31, scope: !38)
!65 = !DILocation(line: 53, column: 47, scope: !38)
!66 = !DILocation(line: 53, column: 13, scope: !38)
!67 = !DILocation(line: 54, column: 18, scope: !38)
!68 = !DILocation(line: 54, column: 13, scope: !38)
!69 = !DILocation(line: 56, column: 5, scope: !39)
!70 = !DILocation(line: 57, column: 1, scope: !31)
!71 = distinct !DISubprogram(name: "CWE122_Heap_Based_Buffer_Overflow__char_type_overrun_memcpy_05_good", scope: !8, file: !8, line: 110, type: !32, scopeLine: 111, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DILocation(line: 112, column: 5, scope: !71)
!73 = !DILocation(line: 113, column: 5, scope: !71)
!74 = !DILocation(line: 114, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 125, type: !76, scopeLine: 126, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!76 = !DISubroutineType(types: !77)
!77 = !{!24, !24, !78}
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !8, line: 125, type: !24)
!80 = !DILocation(line: 125, column: 14, scope: !75)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !8, line: 125, type: !78)
!82 = !DILocation(line: 125, column: 27, scope: !75)
!83 = !DILocation(line: 128, column: 22, scope: !75)
!84 = !DILocation(line: 128, column: 12, scope: !75)
!85 = !DILocation(line: 128, column: 5, scope: !75)
!86 = !DILocation(line: 130, column: 5, scope: !75)
!87 = !DILocation(line: 131, column: 5, scope: !75)
!88 = !DILocation(line: 132, column: 5, scope: !75)
!89 = !DILocation(line: 135, column: 5, scope: !75)
!90 = !DILocation(line: 136, column: 5, scope: !75)
!91 = !DILocation(line: 137, column: 5, scope: !75)
!92 = !DILocation(line: 139, column: 5, scope: !75)
!93 = distinct !DISubprogram(name: "good1", scope: !8, file: !8, line: 64, type: !32, scopeLine: 65, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!94 = !DILocation(line: 66, column: 8, scope: !95)
!95 = distinct !DILexicalBlock(scope: !93, file: !8, line: 66, column: 8)
!96 = !DILocation(line: 66, column: 8, scope: !93)
!97 = !DILocation(line: 69, column: 9, scope: !98)
!98 = distinct !DILexicalBlock(scope: !95, file: !8, line: 67, column: 5)
!99 = !DILocation(line: 70, column: 5, scope: !98)
!100 = !DILocalVariable(name: "structCharVoid", scope: !101, file: !8, line: 74, type: !6)
!101 = distinct !DILexicalBlock(scope: !102, file: !8, line: 73, column: 9)
!102 = distinct !DILexicalBlock(scope: !95, file: !8, line: 72, column: 5)
!103 = !DILocation(line: 74, column: 24, scope: !101)
!104 = !DILocation(line: 74, column: 53, scope: !101)
!105 = !DILocation(line: 74, column: 41, scope: !101)
!106 = !DILocation(line: 75, column: 17, scope: !107)
!107 = distinct !DILexicalBlock(scope: !101, file: !8, line: 75, column: 17)
!108 = !DILocation(line: 75, column: 32, scope: !107)
!109 = !DILocation(line: 75, column: 17, scope: !101)
!110 = !DILocation(line: 75, column: 42, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !8, line: 75, column: 41)
!112 = !DILocation(line: 76, column: 13, scope: !101)
!113 = !DILocation(line: 76, column: 29, scope: !101)
!114 = !DILocation(line: 76, column: 40, scope: !101)
!115 = !DILocation(line: 78, column: 31, scope: !101)
!116 = !DILocation(line: 78, column: 47, scope: !101)
!117 = !DILocation(line: 78, column: 13, scope: !101)
!118 = !DILocation(line: 80, column: 20, scope: !101)
!119 = !DILocation(line: 80, column: 36, scope: !101)
!120 = !DILocation(line: 80, column: 13, scope: !101)
!121 = !DILocation(line: 81, column: 13, scope: !101)
!122 = !DILocation(line: 81, column: 29, scope: !101)
!123 = !DILocation(line: 81, column: 91, scope: !101)
!124 = !DILocation(line: 82, column: 31, scope: !101)
!125 = !DILocation(line: 82, column: 47, scope: !101)
!126 = !DILocation(line: 82, column: 13, scope: !101)
!127 = !DILocation(line: 83, column: 31, scope: !101)
!128 = !DILocation(line: 83, column: 47, scope: !101)
!129 = !DILocation(line: 83, column: 13, scope: !101)
!130 = !DILocation(line: 84, column: 18, scope: !101)
!131 = !DILocation(line: 84, column: 13, scope: !101)
!132 = !DILocation(line: 87, column: 1, scope: !93)
!133 = distinct !DISubprogram(name: "good2", scope: !8, file: !8, line: 90, type: !32, scopeLine: 91, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!134 = !DILocation(line: 92, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !133, file: !8, line: 92, column: 8)
!136 = !DILocation(line: 92, column: 8, scope: !133)
!137 = !DILocalVariable(name: "structCharVoid", scope: !138, file: !8, line: 95, type: !6)
!138 = distinct !DILexicalBlock(scope: !139, file: !8, line: 94, column: 9)
!139 = distinct !DILexicalBlock(scope: !135, file: !8, line: 93, column: 5)
!140 = !DILocation(line: 95, column: 24, scope: !138)
!141 = !DILocation(line: 95, column: 53, scope: !138)
!142 = !DILocation(line: 95, column: 41, scope: !138)
!143 = !DILocation(line: 96, column: 17, scope: !144)
!144 = distinct !DILexicalBlock(scope: !138, file: !8, line: 96, column: 17)
!145 = !DILocation(line: 96, column: 32, scope: !144)
!146 = !DILocation(line: 96, column: 17, scope: !138)
!147 = !DILocation(line: 96, column: 42, scope: !148)
!148 = distinct !DILexicalBlock(scope: !144, file: !8, line: 96, column: 41)
!149 = !DILocation(line: 97, column: 13, scope: !138)
!150 = !DILocation(line: 97, column: 29, scope: !138)
!151 = !DILocation(line: 97, column: 40, scope: !138)
!152 = !DILocation(line: 99, column: 31, scope: !138)
!153 = !DILocation(line: 99, column: 47, scope: !138)
!154 = !DILocation(line: 99, column: 13, scope: !138)
!155 = !DILocation(line: 101, column: 20, scope: !138)
!156 = !DILocation(line: 101, column: 36, scope: !138)
!157 = !DILocation(line: 101, column: 13, scope: !138)
!158 = !DILocation(line: 102, column: 13, scope: !138)
!159 = !DILocation(line: 102, column: 29, scope: !138)
!160 = !DILocation(line: 102, column: 91, scope: !138)
!161 = !DILocation(line: 103, column: 31, scope: !138)
!162 = !DILocation(line: 103, column: 47, scope: !138)
!163 = !DILocation(line: 103, column: 13, scope: !138)
!164 = !DILocation(line: 104, column: 31, scope: !138)
!165 = !DILocation(line: 104, column: 47, scope: !138)
!166 = !DILocation(line: 104, column: 13, scope: !138)
!167 = !DILocation(line: 105, column: 18, scope: !138)
!168 = !DILocation(line: 105, column: 13, scope: !138)
!169 = !DILocation(line: 107, column: 5, scope: !139)
!170 = !DILocation(line: 108, column: 1, scope: !133)
