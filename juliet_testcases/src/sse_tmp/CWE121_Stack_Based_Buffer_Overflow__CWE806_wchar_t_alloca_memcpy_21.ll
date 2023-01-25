; ModuleID = './juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_21.c'
source_filename = "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_21.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@badStatic = internal global i32 0, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@goodG2B1Static = internal global i32 0, align 4, !dbg !12
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1
@goodG2B2Static = internal global i32 0, align 4, !dbg !15

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_21_bad() #0 !dbg !23 {
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
  %5 = bitcast i32* %arraydecay to i8*, !dbg !44
  %6 = load i32*, i32** %data, align 8, !dbg !45
  %7 = bitcast i32* %6 to i8*, !dbg !44
  %8 = load i32*, i32** %data, align 8, !dbg !46
  %call1 = call i64 @wcslen(i32* %8) #7, !dbg !47
  %mul = mul i64 %call1, 4, !dbg !48
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !44
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !49
  store i32 0, i32* %arrayidx, align 4, !dbg !50
  %9 = load i32*, i32** %data, align 8, !dbg !51
  call void @printWLine(i32* %9), !dbg !52
  ret void, !dbg !53
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define internal i32* @badSource(i32* %data) #0 !dbg !54 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !57, metadata !DIExpression()), !dbg !58
  %0 = load i32, i32* @badStatic, align 4, !dbg !59
  %tobool = icmp ne i32 %0, 0, !dbg !59
  br i1 %tobool, label %if.then, label %if.end, !dbg !61

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !62
  %call = call i32* @wmemset(i32* %1, i32 65, i64 99) #8, !dbg !64
  %2 = load i32*, i32** %data.addr, align 8, !dbg !65
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 99, !dbg !65
  store i32 0, i32* %arrayidx, align 4, !dbg !66
  br label %if.end, !dbg !67

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !68
  ret i32* %3, !dbg !69
}

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_21_good() #0 !dbg !70 {
entry:
  call void @goodG2B1(), !dbg !71
  call void @goodG2B2(), !dbg !72
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #8, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #8, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_21_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_21_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

declare dso_local void @printLine(i8*) #5

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !94 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %0 = alloca i8, i64 400, align 16, !dbg !99
  %1 = bitcast i8* %0 to i32*, !dbg !100
  store i32* %1, i32** %dataBuffer, align 8, !dbg !98
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !101
  store i32* %2, i32** %data, align 8, !dbg !102
  store i32 0, i32* @goodG2B1Static, align 4, !dbg !103
  %3 = load i32*, i32** %data, align 8, !dbg !104
  %call = call i32* @goodG2B1Source(i32* %3), !dbg !105
  store i32* %call, i32** %data, align 8, !dbg !106
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !107, metadata !DIExpression()), !dbg !109
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !109
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !109
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !110
  %5 = bitcast i32* %arraydecay to i8*, !dbg !110
  %6 = load i32*, i32** %data, align 8, !dbg !111
  %7 = bitcast i32* %6 to i8*, !dbg !110
  %8 = load i32*, i32** %data, align 8, !dbg !112
  %call1 = call i64 @wcslen(i32* %8) #7, !dbg !113
  %mul = mul i64 %call1, 4, !dbg !114
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !110
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !115
  store i32 0, i32* %arrayidx, align 4, !dbg !116
  %9 = load i32*, i32** %data, align 8, !dbg !117
  call void @printWLine(i32* %9), !dbg !118
  ret void, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B1Source(i32* %data) #0 !dbg !120 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !121, metadata !DIExpression()), !dbg !122
  %0 = load i32, i32* @goodG2B1Static, align 4, !dbg !123
  %tobool = icmp ne i32 %0, 0, !dbg !123
  br i1 %tobool, label %if.then, label %if.else, !dbg !125

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !126
  br label %if.end, !dbg !128

if.else:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !129
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #8, !dbg !131
  %2 = load i32*, i32** %data.addr, align 8, !dbg !132
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !132
  store i32 0, i32* %arrayidx, align 4, !dbg !133
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %3 = load i32*, i32** %data.addr, align 8, !dbg !134
  ret i32* %3, !dbg !135
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !136 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dest = alloca [50 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !137, metadata !DIExpression()), !dbg !138
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !139, metadata !DIExpression()), !dbg !140
  %0 = alloca i8, i64 400, align 16, !dbg !141
  %1 = bitcast i8* %0 to i32*, !dbg !142
  store i32* %1, i32** %dataBuffer, align 8, !dbg !140
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !143
  store i32* %2, i32** %data, align 8, !dbg !144
  store i32 1, i32* @goodG2B2Static, align 4, !dbg !145
  %3 = load i32*, i32** %data, align 8, !dbg !146
  %call = call i32* @goodG2B2Source(i32* %3), !dbg !147
  store i32* %call, i32** %data, align 8, !dbg !148
  call void @llvm.dbg.declare(metadata [50 x i32]* %dest, metadata !149, metadata !DIExpression()), !dbg !151
  %4 = bitcast [50 x i32]* %dest to i8*, !dbg !151
  call void @llvm.memset.p0i8.i64(i8* align 16 %4, i8 0, i64 200, i1 false), !dbg !151
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 0, !dbg !152
  %5 = bitcast i32* %arraydecay to i8*, !dbg !152
  %6 = load i32*, i32** %data, align 8, !dbg !153
  %7 = bitcast i32* %6 to i8*, !dbg !152
  %8 = load i32*, i32** %data, align 8, !dbg !154
  %call1 = call i64 @wcslen(i32* %8) #7, !dbg !155
  %mul = mul i64 %call1, 4, !dbg !156
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %5, i8* align 4 %7, i64 %mul, i1 false), !dbg !152
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dest, i64 0, i64 49, !dbg !157
  store i32 0, i32* %arrayidx, align 4, !dbg !158
  %9 = load i32*, i32** %data, align 8, !dbg !159
  call void @printWLine(i32* %9), !dbg !160
  ret void, !dbg !161
}

; Function Attrs: noinline nounwind uwtable
define internal i32* @goodG2B2Source(i32* %data) #0 !dbg !162 {
entry:
  %data.addr = alloca i32*, align 8
  store i32* %data, i32** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i32** %data.addr, metadata !163, metadata !DIExpression()), !dbg !164
  %0 = load i32, i32* @goodG2B2Static, align 4, !dbg !165
  %tobool = icmp ne i32 %0, 0, !dbg !165
  br i1 %tobool, label %if.then, label %if.end, !dbg !167

if.then:                                          ; preds = %entry
  %1 = load i32*, i32** %data.addr, align 8, !dbg !168
  %call = call i32* @wmemset(i32* %1, i32 65, i64 49) #8, !dbg !170
  %2 = load i32*, i32** %data.addr, align 8, !dbg !171
  %arrayidx = getelementptr inbounds i32, i32* %2, i64 49, !dbg !171
  store i32 0, i32* %arrayidx, align 4, !dbg !172
  br label %if.end, !dbg !173

if.end:                                           ; preds = %if.then, %entry
  %3 = load i32*, i32** %data.addr, align 8, !dbg !174
  ret i32* %3, !dbg !175
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21}
!llvm.ident = !{!22}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "badStatic", scope: !2, file: !14, line: 24, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !11, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6, !10}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !8, line: 74, baseType: !9)
!8 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!11 = !{!0, !12, !15}
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "goodG2B1Static", scope: !2, file: !14, line: 58, type: !9, isLocal: true, isDefinition: true)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_21.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DIGlobalVariableExpression(var: !16, expr: !DIExpression())
!16 = distinct !DIGlobalVariable(name: "goodG2B2Static", scope: !2, file: !14, line: 59, type: !9, isLocal: true, isDefinition: true)
!17 = !{i32 7, !"Dwarf Version", i32 4}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"uwtable", i32 1}
!21 = !{i32 7, !"frame-pointer", i32 2}
!22 = !{!"clang version 13.0.0"}
!23 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_21_bad", scope: !14, file: !14, line: 37, type: !24, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!24 = !DISubroutineType(types: !25)
!25 = !{null}
!26 = !DILocalVariable(name: "data", scope: !23, file: !14, line: 39, type: !6)
!27 = !DILocation(line: 39, column: 15, scope: !23)
!28 = !DILocalVariable(name: "dataBuffer", scope: !23, file: !14, line: 40, type: !6)
!29 = !DILocation(line: 40, column: 15, scope: !23)
!30 = !DILocation(line: 40, column: 39, scope: !23)
!31 = !DILocation(line: 40, column: 28, scope: !23)
!32 = !DILocation(line: 41, column: 12, scope: !23)
!33 = !DILocation(line: 41, column: 10, scope: !23)
!34 = !DILocation(line: 42, column: 15, scope: !23)
!35 = !DILocation(line: 43, column: 22, scope: !23)
!36 = !DILocation(line: 43, column: 12, scope: !23)
!37 = !DILocation(line: 43, column: 10, scope: !23)
!38 = !DILocalVariable(name: "dest", scope: !39, file: !14, line: 45, type: !40)
!39 = distinct !DILexicalBlock(scope: !23, file: !14, line: 44, column: 5)
!40 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 1600, elements: !41)
!41 = !{!42}
!42 = !DISubrange(count: 50)
!43 = !DILocation(line: 45, column: 17, scope: !39)
!44 = !DILocation(line: 47, column: 9, scope: !39)
!45 = !DILocation(line: 47, column: 22, scope: !39)
!46 = !DILocation(line: 47, column: 35, scope: !39)
!47 = !DILocation(line: 47, column: 28, scope: !39)
!48 = !DILocation(line: 47, column: 40, scope: !39)
!49 = !DILocation(line: 48, column: 9, scope: !39)
!50 = !DILocation(line: 48, column: 20, scope: !39)
!51 = !DILocation(line: 49, column: 20, scope: !39)
!52 = !DILocation(line: 49, column: 9, scope: !39)
!53 = !DILocation(line: 51, column: 1, scope: !23)
!54 = distinct !DISubprogram(name: "badSource", scope: !14, file: !14, line: 26, type: !55, scopeLine: 27, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!55 = !DISubroutineType(types: !56)
!56 = !{!6, !6}
!57 = !DILocalVariable(name: "data", arg: 1, scope: !54, file: !14, line: 26, type: !6)
!58 = !DILocation(line: 26, column: 38, scope: !54)
!59 = !DILocation(line: 28, column: 8, scope: !60)
!60 = distinct !DILexicalBlock(scope: !54, file: !14, line: 28, column: 8)
!61 = !DILocation(line: 28, column: 8, scope: !54)
!62 = !DILocation(line: 31, column: 17, scope: !63)
!63 = distinct !DILexicalBlock(scope: !60, file: !14, line: 29, column: 5)
!64 = !DILocation(line: 31, column: 9, scope: !63)
!65 = !DILocation(line: 32, column: 9, scope: !63)
!66 = !DILocation(line: 32, column: 21, scope: !63)
!67 = !DILocation(line: 33, column: 5, scope: !63)
!68 = !DILocation(line: 34, column: 12, scope: !54)
!69 = !DILocation(line: 34, column: 5, scope: !54)
!70 = distinct !DISubprogram(name: "CWE121_Stack_Based_Buffer_Overflow__CWE806_wchar_t_alloca_memcpy_21_good", scope: !14, file: !14, line: 122, type: !24, scopeLine: 123, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!71 = !DILocation(line: 124, column: 5, scope: !70)
!72 = !DILocation(line: 125, column: 5, scope: !70)
!73 = !DILocation(line: 126, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 138, type: !75, scopeLine: 139, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!75 = !DISubroutineType(types: !76)
!76 = !{!9, !9, !77}
!77 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !78, size: 64)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!79 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !14, line: 138, type: !9)
!81 = !DILocation(line: 138, column: 14, scope: !74)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !14, line: 138, type: !77)
!83 = !DILocation(line: 138, column: 27, scope: !74)
!84 = !DILocation(line: 141, column: 22, scope: !74)
!85 = !DILocation(line: 141, column: 12, scope: !74)
!86 = !DILocation(line: 141, column: 5, scope: !74)
!87 = !DILocation(line: 143, column: 5, scope: !74)
!88 = !DILocation(line: 144, column: 5, scope: !74)
!89 = !DILocation(line: 145, column: 5, scope: !74)
!90 = !DILocation(line: 148, column: 5, scope: !74)
!91 = !DILocation(line: 149, column: 5, scope: !74)
!92 = !DILocation(line: 150, column: 5, scope: !74)
!93 = !DILocation(line: 152, column: 5, scope: !74)
!94 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 78, type: !24, scopeLine: 79, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!95 = !DILocalVariable(name: "data", scope: !94, file: !14, line: 80, type: !6)
!96 = !DILocation(line: 80, column: 15, scope: !94)
!97 = !DILocalVariable(name: "dataBuffer", scope: !94, file: !14, line: 81, type: !6)
!98 = !DILocation(line: 81, column: 15, scope: !94)
!99 = !DILocation(line: 81, column: 39, scope: !94)
!100 = !DILocation(line: 81, column: 28, scope: !94)
!101 = !DILocation(line: 82, column: 12, scope: !94)
!102 = !DILocation(line: 82, column: 10, scope: !94)
!103 = !DILocation(line: 83, column: 20, scope: !94)
!104 = !DILocation(line: 84, column: 27, scope: !94)
!105 = !DILocation(line: 84, column: 12, scope: !94)
!106 = !DILocation(line: 84, column: 10, scope: !94)
!107 = !DILocalVariable(name: "dest", scope: !108, file: !14, line: 86, type: !40)
!108 = distinct !DILexicalBlock(scope: !94, file: !14, line: 85, column: 5)
!109 = !DILocation(line: 86, column: 17, scope: !108)
!110 = !DILocation(line: 88, column: 9, scope: !108)
!111 = !DILocation(line: 88, column: 22, scope: !108)
!112 = !DILocation(line: 88, column: 35, scope: !108)
!113 = !DILocation(line: 88, column: 28, scope: !108)
!114 = !DILocation(line: 88, column: 40, scope: !108)
!115 = !DILocation(line: 89, column: 9, scope: !108)
!116 = !DILocation(line: 89, column: 20, scope: !108)
!117 = !DILocation(line: 90, column: 20, scope: !108)
!118 = !DILocation(line: 90, column: 9, scope: !108)
!119 = !DILocation(line: 92, column: 1, scope: !94)
!120 = distinct !DISubprogram(name: "goodG2B1Source", scope: !14, file: !14, line: 62, type: !55, scopeLine: 63, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!121 = !DILocalVariable(name: "data", arg: 1, scope: !120, file: !14, line: 62, type: !6)
!122 = !DILocation(line: 62, column: 43, scope: !120)
!123 = !DILocation(line: 64, column: 8, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !14, line: 64, column: 8)
!125 = !DILocation(line: 64, column: 8, scope: !120)
!126 = !DILocation(line: 67, column: 9, scope: !127)
!127 = distinct !DILexicalBlock(scope: !124, file: !14, line: 65, column: 5)
!128 = !DILocation(line: 68, column: 5, scope: !127)
!129 = !DILocation(line: 72, column: 17, scope: !130)
!130 = distinct !DILexicalBlock(scope: !124, file: !14, line: 70, column: 5)
!131 = !DILocation(line: 72, column: 9, scope: !130)
!132 = !DILocation(line: 73, column: 9, scope: !130)
!133 = !DILocation(line: 73, column: 20, scope: !130)
!134 = !DILocation(line: 75, column: 12, scope: !120)
!135 = !DILocation(line: 75, column: 5, scope: !120)
!136 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 106, type: !24, scopeLine: 107, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!137 = !DILocalVariable(name: "data", scope: !136, file: !14, line: 108, type: !6)
!138 = !DILocation(line: 108, column: 15, scope: !136)
!139 = !DILocalVariable(name: "dataBuffer", scope: !136, file: !14, line: 109, type: !6)
!140 = !DILocation(line: 109, column: 15, scope: !136)
!141 = !DILocation(line: 109, column: 39, scope: !136)
!142 = !DILocation(line: 109, column: 28, scope: !136)
!143 = !DILocation(line: 110, column: 12, scope: !136)
!144 = !DILocation(line: 110, column: 10, scope: !136)
!145 = !DILocation(line: 111, column: 20, scope: !136)
!146 = !DILocation(line: 112, column: 27, scope: !136)
!147 = !DILocation(line: 112, column: 12, scope: !136)
!148 = !DILocation(line: 112, column: 10, scope: !136)
!149 = !DILocalVariable(name: "dest", scope: !150, file: !14, line: 114, type: !40)
!150 = distinct !DILexicalBlock(scope: !136, file: !14, line: 113, column: 5)
!151 = !DILocation(line: 114, column: 17, scope: !150)
!152 = !DILocation(line: 116, column: 9, scope: !150)
!153 = !DILocation(line: 116, column: 22, scope: !150)
!154 = !DILocation(line: 116, column: 35, scope: !150)
!155 = !DILocation(line: 116, column: 28, scope: !150)
!156 = !DILocation(line: 116, column: 40, scope: !150)
!157 = !DILocation(line: 117, column: 9, scope: !150)
!158 = !DILocation(line: 117, column: 20, scope: !150)
!159 = !DILocation(line: 118, column: 20, scope: !150)
!160 = !DILocation(line: 118, column: 9, scope: !150)
!161 = !DILocation(line: 120, column: 1, scope: !136)
!162 = distinct !DISubprogram(name: "goodG2B2Source", scope: !14, file: !14, line: 95, type: !55, scopeLine: 96, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!163 = !DILocalVariable(name: "data", arg: 1, scope: !162, file: !14, line: 95, type: !6)
!164 = !DILocation(line: 95, column: 43, scope: !162)
!165 = !DILocation(line: 97, column: 8, scope: !166)
!166 = distinct !DILexicalBlock(scope: !162, file: !14, line: 97, column: 8)
!167 = !DILocation(line: 97, column: 8, scope: !162)
!168 = !DILocation(line: 100, column: 17, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !14, line: 98, column: 5)
!170 = !DILocation(line: 100, column: 9, scope: !169)
!171 = !DILocation(line: 101, column: 9, scope: !169)
!172 = !DILocation(line: 101, column: 20, scope: !169)
!173 = !DILocation(line: 102, column: 5, scope: !169)
!174 = !DILocation(line: 103, column: 12, scope: !162)
!175 = !DILocation(line: 103, column: 5, scope: !162)
