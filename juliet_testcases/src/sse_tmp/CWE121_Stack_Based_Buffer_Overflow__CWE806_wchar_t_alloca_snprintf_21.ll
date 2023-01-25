; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_21.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [3 x i32] [i32 37, i32 115, i32 0], align 4
@.str.1 = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.2 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.3 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.4 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !12
@.str.5 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !15

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_21_bad() #0 !dbg !23 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !28, metadata !DIExpression()), !dbg !29
  %0 = alloca i8, i64 400, align 16, !dbg !30
  %1 = bitcast i8* %0 to i32*, !dbg !31
  store i32* %1, i32** %dataBuffer, align 8, !dbg !29
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  store i32* %2, i32** %data, align 8, !dbg !33
  store i32 1, i32* @badStatic, align 4, !dbg !34
  %3 = load i32*, i32** %data, align 8, !dbg !35
  %call = call i32* @badSource(i32* %3), !dbg !36
  store i32* %call, i32** %data, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !38, metadata !DIExpression()), !dbg !43
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !43
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !45
  %call1 = call i64 @wcslen(i32* %5) #6, !dbg !46
  %6 = load i32*, i32** %data, align 8, !dbg !47
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #7, !dbg !48
  %7 = load i32*, i32** %data, align 8, !dbg !49
  call void @printWLine(i32* %7), !dbg !50
  ret void, !dbg !51
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !52 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !55, metadata !DIExpression()), !dbg !56
  %0 = load i32, i32* @badStatic, align 4, !dbg !57
  %tobool = icmp ne i32 %0, 0, !dbg !57
  br i1 %tobool, label %if.then, label %if.end, !dbg !59

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !60
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #7, !dbg !62
  %2 = load i32*, i32** %data.addr, align 8, !dbg !63
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !63
  store i32 0, i32* %arrayidx, align 4, !dbg !64
  br label %if.end, !dbg !65

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !66
  ret i32* %3, !dbg !67
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind
declare dso_local i32 @swprintf(i32*, i64, i32*, ...) #3

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_21_good() #0 !dbg !68 {
entry:
  call void @goodG2B1(), !dbg !69
  call void @goodG2B2(), !dbg !70
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
  %call = call i64 @time(i64* null) #7, !dbg !82
  %conv = trunc i64 %call to i32, !dbg !83
  call void @srand(i32 %conv) #7, !dbg !84
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.1, i64 0, i64 0)), !dbg !85
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_21_good(), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.3, i64 0, i64 0)), !dbg !88
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_21_bad(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i64 0, i64 0)), !dbg !90
  ret i32 0, !dbg !91
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = alloca i8, i64 400, align 16, !dbg !97
  %1 = bitcast i8* %0 to i32*, !dbg !98
  store i32* %1, i32** %dataBuffer, align 8, !dbg !96
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !99
  store i32* %2, i32** %data, align 8, !dbg !100
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !101
  %3 = load i32*, i32** %data, align 8, !dbg !102
  %call = call i32* @goodG2B1Source(i32* %3), !dbg !103
  store i32* %call, i32** %data, align 8, !dbg !104
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !107
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !107
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !108
  %5 = load i32*, i32** %data, align 8, !dbg !109
  %call1 = call i64 @wcslen(i32* %5) #6, !dbg !110
  %6 = load i32*, i32** %data, align 8, !dbg !111
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #7, !dbg !112
  %7 = load i32*, i32** %data, align 8, !dbg !113
  call void @printWLine(i32* %7), !dbg !114
  ret void, !dbg !115
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !116 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !117, metadata !DIExpression()), !dbg !118
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !119
  %tobool = icmp ne i32 %0, 0, !dbg !119
  br i1 %tobool, label %if.then, label %if.else, !dbg !121

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.5, i64 0, i64 0)), !dbg !122
  br label %if.end, !dbg !124

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !125
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #7, !dbg !127
  %2 = load i32*, i32** %data.addr, align 8, !dbg !128
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !128
  store i32 0, i32* %arrayidx, align 4, !dbg !129
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !130
  ret i32* %3, !dbg !131
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !132 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !133, metadata !DIExpression()), !dbg !134
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !135, metadata !DIExpression()), !dbg !136
  %0 = alloca i8, i64 400, align 16, !dbg !137
  %1 = bitcast i8* %0 to i32*, !dbg !138
  store i32* %1, i32** %dataBuffer, align 8, !dbg !136
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !139
  store i32* %2, i32** %data, align 8, !dbg !140
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !141
  %3 = load i32*, i32** %data, align 8, !dbg !142
  %call = call i32* @goodG2B2Source(i32* %3), !dbg !143
  store i32* %call, i32** %data, align 8, !dbg !144
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !145, metadata !DIExpression()), !dbg !147
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !147
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !147
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !148
  %5 = load i32*, i32** %data, align 8, !dbg !149
  %call1 = call i64 @wcslen(i32* %5) #6, !dbg !150
  %6 = load i32*, i32** %data, align 8, !dbg !151
  %call2 = call i32 (i32*, i64, i32*, ...) @swprintf(i32* %arraydecay, i64 %call1, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @.str, i64 0, i64 0), i32* %6) #7, !dbg !152
  %7 = load i32*, i32** %data, align 8, !dbg !153
  call void @printWLine(i32* %7), !dbg !154
  ret void, !dbg !155
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !156 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !157, metadata !DIExpression()), !dbg !158
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !159
  %tobool = icmp ne i32 %0, 0, !dbg !159
  br i1 %tobool, label %if.then, label %if.end, !dbg !161

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !162
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #7, !dbg !164
  %2 = load i32*, i32** %data.addr, align 8, !dbg !165
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !165
  store i32 0, i32* %arrayidx, align 4, !dbg !166
  br label %if.end, !dbg !167

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !168
  ret i32* %3, !dbg !169
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !14, line: 30, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12, !15}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !14, line: 63, type: !9, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_21.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !14, line: 64, type: !9, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_21_bad", scope: !14, file: !14, line: 43, type: !24, scopeLine: 44, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !14, line: 45, type: !6)
!27 = !DILocation(line: 45, column: 15, scope: !23)
!28 = !DILocalVariable(name: "dataBuffer", scope: !23, file: !14, line: 46, type: !6)
!29 = !DILocation(line: 46, column: 15, scope: !23)
!30 = !DILocation(line: 46, column: 39, scope: !23)
!31 = !DILocation(line: 46, column: 28, scope: !23)
!32 = !DILocation(line: 47, column: 12, scope: !23)
!33 = !DILocation(line: 47, column: 10, scope: !23)
!34 = !DILocation(line: 48, column: 15, scope: !23)
!35 = !DILocation(line: 49, column: 22, scope: !23)
!36 = !DILocation(line: 49, column: 12, scope: !23)
!37 = !DILocation(line: 49, column: 10, scope: !23)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !14, line: 51, type: !40)
!39 = distinct !DILexicalBlock(scope: !23, file: !14, line: 50, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 51, column: 17, scope: !39)
!44 = !DILocation(line: 53, column: 18, scope: !39)
!45 = !DILocation(line: 53, column: 31, scope: !39)
!46 = !DILocation(line: 53, column: 24, scope: !39)
!47 = !DILocation(line: 53, column: 45, scope: !39)
!48 = !DILocation(line: 53, column: 9, scope: !39)
!49 = !DILocation(line: 54, column: 20, scope: !39)
!50 = !DILocation(line: 54, column: 9, scope: !39)
!51 = !DILocation(line: 56, column: 1, scope: !23)
!52 = distinct !DISubprogram(name: "badSource", scope: !14, file: !14, line: 32, type: !53, scopeLine: 33, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!53 = !DISubroutineType(types: !54)
!54 = !{!6, !6}
!55 = !DILocalVariable(name: "data", arg: 1, scope: !52, file: !14, line: 32, type: !6)
!56 = !DILocation(line: 32, column: 38, scope: !52)
!57 = !DILocation(line: 34, column: 8, scope: !58)
!58 = distinct !DILexicalBlock(scope: !52, file: !14, line: 34, column: 8)
!59 = !DILocation(line: 34, column: 8, scope: !52)
!60 = !DILocation(line: 37, column: 17, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !14, line: 35, column: 5)
!62 = !DILocation(line: 37, column: 9, scope: !61)
!63 = !DILocation(line: 38, column: 9, scope: !61)
!64 = !DILocation(line: 38, column: 21, scope: !61)
!65 = !DILocation(line: 39, column: 5, scope: !61)
!66 = !DILocation(line: 40, column: 12, scope: !52)
!67 = !DILocation(line: 40, column: 5, scope: !52)
!68 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_snprintf_21_good", scope: !14, file: !14, line: 125, type: !24, scopeLine: 126, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!69 = !DILocation(line: 127, column: 5, scope: !68)
!70 = !DILocation(line: 128, column: 5, scope: !68)
!71 = !DILocation(line: 129, column: 1, scope: !68)
!72 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 141, type: !73, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!73 = !DISubroutineType(types: !74)
!74 = !{!9, !9, !75}
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !77, size: 64)
!77 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!78 = !DILocalVariable(name: "argc", arg: 1, scope: !72, file: !14, line: 141, type: !9)
!79 = !DILocation(line: 141, column: 14, scope: !72)
!80 = !DILocalVariable(name: "argv", arg: 2, scope: !72, file: !14, line: 141, type: !75)
!81 = !DILocation(line: 141, column: 27, scope: !72)
!82 = !DILocation(line: 144, column: 22, scope: !72)
!83 = !DILocation(line: 144, column: 12, scope: !72)
!84 = !DILocation(line: 144, column: 5, scope: !72)
!85 = !DILocation(line: 146, column: 5, scope: !72)
!86 = !DILocation(line: 147, column: 5, scope: !72)
!87 = !DILocation(line: 148, column: 5, scope: !72)
!88 = !DILocation(line: 151, column: 5, scope: !72)
!89 = !DILocation(line: 152, column: 5, scope: !72)
!90 = !DILocation(line: 153, column: 5, scope: !72)
!91 = !DILocation(line: 155, column: 5, scope: !72)
!92 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 83, type: !24, scopeLine: 84, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!93 = !DILocalVariable(name: "data", scope: !92, file: !14, line: 85, type: !6)
!94 = !DILocation(line: 85, column: 15, scope: !92)
!95 = !DILocalVariable(name: "dataBuffer", scope: !92, file: !14, line: 86, type: !6)
!96 = !DILocation(line: 86, column: 15, scope: !92)
!97 = !DILocation(line: 86, column: 39, scope: !92)
!98 = !DILocation(line: 86, column: 28, scope: !92)
!99 = !DILocation(line: 87, column: 12, scope: !92)
!100 = !DILocation(line: 87, column: 10, scope: !92)
!101 = !DILocation(line: 88, column: 20, scope: !92)
!102 = !DILocation(line: 89, column: 27, scope: !92)
!103 = !DILocation(line: 89, column: 12, scope: !92)
!104 = !DILocation(line: 89, column: 10, scope: !92)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !14, line: 91, type: !40)
!106 = distinct !DILexicalBlock(scope: !92, file: !14, line: 90, column: 5)
!107 = !DILocation(line: 91, column: 17, scope: !106)
!108 = !DILocation(line: 93, column: 18, scope: !106)
!109 = !DILocation(line: 93, column: 31, scope: !106)
!110 = !DILocation(line: 93, column: 24, scope: !106)
!111 = !DILocation(line: 93, column: 45, scope: !106)
!112 = !DILocation(line: 93, column: 9, scope: !106)
!113 = !DILocation(line: 94, column: 20, scope: !106)
!114 = !DILocation(line: 94, column: 9, scope: !106)
!115 = !DILocation(line: 96, column: 1, scope: !92)
!116 = distinct !DISubprogram(name: "goodG2B1Source", scope: !14, file: !14, line: 67, type: !53, scopeLine: 68, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!117 = !DILocalVariable(name: "data", arg: 1, scope: !116, file: !14, line: 67, type: !6)
!118 = !DILocation(line: 67, column: 43, scope: !116)
!119 = !DILocation(line: 69, column: 8, scope: !120)
!120 = distinct !DILexicalBlock(scope: !116, file: !14, line: 69, column: 8)
!121 = !DILocation(line: 69, column: 8, scope: !116)
!122 = !DILocation(line: 72, column: 9, scope: !123)
!123 = distinct !DILexicalBlock(scope: !120, file: !14, line: 70, column: 5)
!124 = !DILocation(line: 73, column: 5, scope: !123)
!125 = !DILocation(line: 77, column: 17, scope: !126)
!126 = distinct !DILexicalBlock(scope: !120, file: !14, line: 75, column: 5)
!127 = !DILocation(line: 77, column: 9, scope: !126)
!128 = !DILocation(line: 78, column: 9, scope: !126)
!129 = !DILocation(line: 78, column: 20, scope: !126)
!130 = !DILocation(line: 80, column: 12, scope: !116)
!131 = !DILocation(line: 80, column: 5, scope: !116)
!132 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 110, type: !24, scopeLine: 111, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!133 = !DILocalVariable(name: "data", scope: !132, file: !14, line: 112, type: !6)
!134 = !DILocation(line: 112, column: 15, scope: !132)
!135 = !DILocalVariable(name: "dataBuffer", scope: !132, file: !14, line: 113, type: !6)
!136 = !DILocation(line: 113, column: 15, scope: !132)
!137 = !DILocation(line: 113, column: 39, scope: !132)
!138 = !DILocation(line: 113, column: 28, scope: !132)
!139 = !DILocation(line: 114, column: 12, scope: !132)
!140 = !DILocation(line: 114, column: 10, scope: !132)
!141 = !DILocation(line: 115, column: 20, scope: !132)
!142 = !DILocation(line: 116, column: 27, scope: !132)
!143 = !DILocation(line: 116, column: 12, scope: !132)
!144 = !DILocation(line: 116, column: 10, scope: !132)
!145 = !DILocalVariable(name: "dest", scope: !146, file: !14, line: 118, type: !40)
!146 = distinct !DILexicalBlock(scope: !132, file: !14, line: 117, column: 5)
!147 = !DILocation(line: 118, column: 17, scope: !146)
!148 = !DILocation(line: 120, column: 18, scope: !146)
!149 = !DILocation(line: 120, column: 31, scope: !146)
!150 = !DILocation(line: 120, column: 24, scope: !146)
!151 = !DILocation(line: 120, column: 45, scope: !146)
!152 = !DILocation(line: 120, column: 9, scope: !146)
!153 = !DILocation(line: 121, column: 20, scope: !146)
!154 = !DILocation(line: 121, column: 9, scope: !146)
!155 = !DILocation(line: 123, column: 1, scope: !132)
!156 = distinct !DISubprogram(name: "goodG2B2Source", scope: !14, file: !14, line: 99, type: !53, scopeLine: 100, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!157 = !DILocalVariable(name: "data", arg: 1, scope: !156, file: !14, line: 99, type: !6)
!158 = !DILocation(line: 99, column: 43, scope: !156)
!159 = !DILocation(line: 101, column: 8, scope: !160)
!160 = distinct !DILexicalBlock(scope: !156, file: !14, line: 101, column: 8)
!161 = !DILocation(line: 101, column: 8, scope: !156)
!162 = !DILocation(line: 104, column: 17, scope: !163)
!163 = distinct !DILexicalBlock(scope: !160, file: !14, line: 102, column: 5)
!164 = !DILocation(line: 104, column: 9, scope: !163)
!165 = !DILocation(line: 105, column: 9, scope: !163)
!166 = !DILocation(line: 105, column: 20, scope: !163)
!167 = !DILocation(line: 106, column: 5, scope: !163)
!168 = !DILocation(line: 107, column: 12, scope: !156)
!169 = !DILocation(line: 107, column: 5, scope: !156)
