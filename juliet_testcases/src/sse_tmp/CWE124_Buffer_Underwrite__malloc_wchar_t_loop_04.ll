; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_04.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_04.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_04_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !23, metadata !DIExpression()), !dbg !27
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !28
  %0 = bitcast i8* %call to i32*, !dbg !29
  store i32* %0, i32** %dataBuffer, align 8, !dbg !27
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !36
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !37
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !40
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !41
  store i32* %add.ptr, i32** %data, align 8, !dbg !42
  call void @llvm.dbg.declare(metadata i64* %i, metadata !43, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !48, metadata !DIExpression()), !dbg !52
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !53
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !54
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx3, align 4, !dbg !56
  store i64 0, i64* %i, align 8, !dbg !57
  br label %for.cond, !dbg !59

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !60
  %cmp4 = icmp ult i64 %5, 100, !dbg !62
  br i1 %cmp4, label %for.body, label %for.end, !dbg !63

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !64
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !66
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !66
  %8 = load i32*, i32** %data, align 8, !dbg !67
  %9 = load i64, i64* %i, align 8, !dbg !68
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !67
  store i32 %7, i32* %arrayidx6, align 4, !dbg !69
  br label %for.inc, !dbg !70

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !71
  %inc = add i64 %10, 1, !dbg !71
  store i64 %inc, i64* %i, align 8, !dbg !71
  br label %for.cond, !dbg !72, !llvm.loop !73

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !76
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !76
  store i32 0, i32* %arrayidx7, align 4, !dbg !77
  %12 = load i32*, i32** %data, align 8, !dbg !78
  call void @printWLine(i32* %12), !dbg !79
  ret void, !dbg !80
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #2

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #3

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_04_good() #0 !dbg !81 {
entry:
  call void @goodG2B1(), !dbg !82
  call void @goodG2B2(), !dbg !83
  ret void, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !85 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !91, metadata !DIExpression()), !dbg !92
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !93, metadata !DIExpression()), !dbg !94
  %call = call i64 @time(i64* null) #5, !dbg !95
  %conv = trunc i64 %call to i32, !dbg !96
  call void @srand(i32 %conv) #5, !dbg !97
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !98
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_04_good(), !dbg !99
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !100
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !101
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_04_bad(), !dbg !102
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !103
  ret i32 0, !dbg !104
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !105 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !106, metadata !DIExpression()), !dbg !107
  store i32* null, i32** %data, align 8, !dbg !108
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !109, metadata !DIExpression()), !dbg !113
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !114
  %0 = bitcast i8* %call to i32*, !dbg !115
  store i32* %0, i32** %dataBuffer, align 8, !dbg !113
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !116
  %cmp = icmp eq i32* %1, null, !dbg !118
  br i1 %cmp, label %if.then, label %if.end, !dbg !119

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !120
  unreachable, !dbg !120

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !122
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !123
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !124
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !124
  store i32 0, i32* %arrayidx, align 4, !dbg !125
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !126
  store i32* %4, i32** %data, align 8, !dbg !127
  call void @llvm.dbg.declare(metadata i64* %i, metadata !128, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !131, metadata !DIExpression()), !dbg !132
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !133
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !134
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !135
  store i32 0, i32* %arrayidx3, align 4, !dbg !136
  store i64 0, i64* %i, align 8, !dbg !137
  br label %for.cond, !dbg !139

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !140
  %cmp4 = icmp ult i64 %5, 100, !dbg !142
  br i1 %cmp4, label %for.body, label %for.end, !dbg !143

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !144
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !146
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !146
  %8 = load i32*, i32** %data, align 8, !dbg !147
  %9 = load i64, i64* %i, align 8, !dbg !148
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !147
  store i32 %7, i32* %arrayidx6, align 4, !dbg !149
  br label %for.inc, !dbg !150

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !151
  %inc = add i64 %10, 1, !dbg !151
  store i64 %inc, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !152, !llvm.loop !153

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !155
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !155
  store i32 0, i32* %arrayidx7, align 4, !dbg !156
  %12 = load i32*, i32** %data, align 8, !dbg !157
  call void @printWLine(i32* %12), !dbg !158
  ret void, !dbg !159
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !160 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !161, metadata !DIExpression()), !dbg !162
  store i32* null, i32** %data, align 8, !dbg !163
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !164, metadata !DIExpression()), !dbg !168
  %call = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !169
  %0 = bitcast i8* %call to i32*, !dbg !170
  store i32* %0, i32** %dataBuffer, align 8, !dbg !168
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !171
  %cmp = icmp eq i32* %1, null, !dbg !173
  br i1 %cmp, label %if.then, label %if.end, !dbg !174

if.then:                                          ; preds = %entry
  call void @exit(i32 -1) #6, !dbg !175
  unreachable, !dbg !175

if.end:                                           ; preds = %entry
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !177
  %call1 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !178
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !179
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !179
  store i32 0, i32* %arrayidx, align 4, !dbg !180
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !181
  store i32* %4, i32** %data, align 8, !dbg !182
  call void @llvm.dbg.declare(metadata i64* %i, metadata !183, metadata !DIExpression()), !dbg !185
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !186, metadata !DIExpression()), !dbg !187
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !188
  %call2 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !189
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !190
  store i32 0, i32* %arrayidx3, align 4, !dbg !191
  store i64 0, i64* %i, align 8, !dbg !192
  br label %for.cond, !dbg !194

for.cond:                                         ; preds = %for.inc, %if.end
  %5 = load i64, i64* %i, align 8, !dbg !195
  %cmp4 = icmp ult i64 %5, 100, !dbg !197
  br i1 %cmp4, label %for.body, label %for.end, !dbg !198

for.body:                                         ; preds = %for.cond
  %6 = load i64, i64* %i, align 8, !dbg !199
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %6, !dbg !201
  %7 = load i32, i32* %arrayidx5, align 4, !dbg !201
  %8 = load i32*, i32** %data, align 8, !dbg !202
  %9 = load i64, i64* %i, align 8, !dbg !203
  %arrayidx6 = getelementptr inbounds i32, i32* %8, i64 %9, !dbg !202
  store i32 %7, i32* %arrayidx6, align 4, !dbg !204
  br label %for.inc, !dbg !205

for.inc:                                          ; preds = %for.body
  %10 = load i64, i64* %i, align 8, !dbg !206
  %inc = add i64 %10, 1, !dbg !206
  store i64 %inc, i64* %i, align 8, !dbg !206
  br label %for.cond, !dbg !207, !llvm.loop !208

for.end:                                          ; preds = %for.cond
  %11 = load i32*, i32** %data, align 8, !dbg !210
  %arrayidx7 = getelementptr inbounds i32, i32* %11, i64 99, !dbg !210
  store i32 0, i32* %arrayidx7, align 4, !dbg !211
  %12 = load i32*, i32** %data, align 8, !dbg !212
  call void @printWLine(i32* %12), !dbg !213
  ret void, !dbg !214
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_04.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_04_bad", scope: !17, file: !17, line: 30, type: !18, scopeLine: 31, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_04.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 32, type: !4)
!21 = !DILocation(line: 32, column: 15, scope: !16)
!22 = !DILocation(line: 33, column: 10, scope: !16)
!23 = !DILocalVariable(name: "dataBuffer", scope: !24, file: !17, line: 37, type: !4)
!24 = distinct !DILexicalBlock(scope: !25, file: !17, line: 36, column: 9)
!25 = distinct !DILexicalBlock(scope: !26, file: !17, line: 35, column: 5)
!26 = distinct !DILexicalBlock(scope: !16, file: !17, line: 34, column: 8)
!27 = !DILocation(line: 37, column: 23, scope: !24)
!28 = !DILocation(line: 37, column: 47, scope: !24)
!29 = !DILocation(line: 37, column: 36, scope: !24)
!30 = !DILocation(line: 38, column: 17, scope: !31)
!31 = distinct !DILexicalBlock(scope: !24, file: !17, line: 38, column: 17)
!32 = !DILocation(line: 38, column: 28, scope: !31)
!33 = !DILocation(line: 38, column: 17, scope: !24)
!34 = !DILocation(line: 38, column: 38, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 38, column: 37)
!36 = !DILocation(line: 39, column: 21, scope: !24)
!37 = !DILocation(line: 39, column: 13, scope: !24)
!38 = !DILocation(line: 40, column: 13, scope: !24)
!39 = !DILocation(line: 40, column: 31, scope: !24)
!40 = !DILocation(line: 42, column: 20, scope: !24)
!41 = !DILocation(line: 42, column: 31, scope: !24)
!42 = !DILocation(line: 42, column: 18, scope: !24)
!43 = !DILocalVariable(name: "i", scope: !44, file: !17, line: 46, type: !45)
!44 = distinct !DILexicalBlock(scope: !16, file: !17, line: 45, column: 5)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !46)
!46 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!47 = !DILocation(line: 46, column: 16, scope: !44)
!48 = !DILocalVariable(name: "source", scope: !44, file: !17, line: 47, type: !49)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 100)
!52 = !DILocation(line: 47, column: 17, scope: !44)
!53 = !DILocation(line: 48, column: 17, scope: !44)
!54 = !DILocation(line: 48, column: 9, scope: !44)
!55 = !DILocation(line: 49, column: 9, scope: !44)
!56 = !DILocation(line: 49, column: 23, scope: !44)
!57 = !DILocation(line: 51, column: 16, scope: !58)
!58 = distinct !DILexicalBlock(scope: !44, file: !17, line: 51, column: 9)
!59 = !DILocation(line: 51, column: 14, scope: !58)
!60 = !DILocation(line: 51, column: 21, scope: !61)
!61 = distinct !DILexicalBlock(scope: !58, file: !17, line: 51, column: 9)
!62 = !DILocation(line: 51, column: 23, scope: !61)
!63 = !DILocation(line: 51, column: 9, scope: !58)
!64 = !DILocation(line: 53, column: 30, scope: !65)
!65 = distinct !DILexicalBlock(scope: !61, file: !17, line: 52, column: 9)
!66 = !DILocation(line: 53, column: 23, scope: !65)
!67 = !DILocation(line: 53, column: 13, scope: !65)
!68 = !DILocation(line: 53, column: 18, scope: !65)
!69 = !DILocation(line: 53, column: 21, scope: !65)
!70 = !DILocation(line: 54, column: 9, scope: !65)
!71 = !DILocation(line: 51, column: 31, scope: !61)
!72 = !DILocation(line: 51, column: 9, scope: !61)
!73 = distinct !{!73, !63, !74, !75}
!74 = !DILocation(line: 54, column: 9, scope: !58)
!75 = !{!"llvm.loop.mustprogress"}
!76 = !DILocation(line: 56, column: 9, scope: !44)
!77 = !DILocation(line: 56, column: 21, scope: !44)
!78 = !DILocation(line: 57, column: 20, scope: !44)
!79 = !DILocation(line: 57, column: 9, scope: !44)
!80 = !DILocation(line: 61, column: 1, scope: !16)
!81 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_04_good", scope: !17, file: !17, line: 140, type: !18, scopeLine: 141, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DILocation(line: 142, column: 5, scope: !81)
!83 = !DILocation(line: 143, column: 5, scope: !81)
!84 = !DILocation(line: 144, column: 1, scope: !81)
!85 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 156, type: !86, scopeLine: 157, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DISubroutineType(types: !87)
!87 = !{!7, !7, !88}
!88 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !89, size: 64)
!89 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !90, size: 64)
!90 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!91 = !DILocalVariable(name: "argc", arg: 1, scope: !85, file: !17, line: 156, type: !7)
!92 = !DILocation(line: 156, column: 14, scope: !85)
!93 = !DILocalVariable(name: "argv", arg: 2, scope: !85, file: !17, line: 156, type: !88)
!94 = !DILocation(line: 156, column: 27, scope: !85)
!95 = !DILocation(line: 159, column: 22, scope: !85)
!96 = !DILocation(line: 159, column: 12, scope: !85)
!97 = !DILocation(line: 159, column: 5, scope: !85)
!98 = !DILocation(line: 161, column: 5, scope: !85)
!99 = !DILocation(line: 162, column: 5, scope: !85)
!100 = !DILocation(line: 163, column: 5, scope: !85)
!101 = !DILocation(line: 166, column: 5, scope: !85)
!102 = !DILocation(line: 167, column: 5, scope: !85)
!103 = !DILocation(line: 168, column: 5, scope: !85)
!104 = !DILocation(line: 170, column: 5, scope: !85)
!105 = distinct !DISubprogram(name: "goodG2B1", scope: !17, file: !17, line: 68, type: !18, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DILocalVariable(name: "data", scope: !105, file: !17, line: 70, type: !4)
!107 = !DILocation(line: 70, column: 15, scope: !105)
!108 = !DILocation(line: 71, column: 10, scope: !105)
!109 = !DILocalVariable(name: "dataBuffer", scope: !110, file: !17, line: 80, type: !4)
!110 = distinct !DILexicalBlock(scope: !111, file: !17, line: 79, column: 9)
!111 = distinct !DILexicalBlock(scope: !112, file: !17, line: 78, column: 5)
!112 = distinct !DILexicalBlock(scope: !105, file: !17, line: 72, column: 8)
!113 = !DILocation(line: 80, column: 23, scope: !110)
!114 = !DILocation(line: 80, column: 47, scope: !110)
!115 = !DILocation(line: 80, column: 36, scope: !110)
!116 = !DILocation(line: 81, column: 17, scope: !117)
!117 = distinct !DILexicalBlock(scope: !110, file: !17, line: 81, column: 17)
!118 = !DILocation(line: 81, column: 28, scope: !117)
!119 = !DILocation(line: 81, column: 17, scope: !110)
!120 = !DILocation(line: 81, column: 38, scope: !121)
!121 = distinct !DILexicalBlock(scope: !117, file: !17, line: 81, column: 37)
!122 = !DILocation(line: 82, column: 21, scope: !110)
!123 = !DILocation(line: 82, column: 13, scope: !110)
!124 = !DILocation(line: 83, column: 13, scope: !110)
!125 = !DILocation(line: 83, column: 31, scope: !110)
!126 = !DILocation(line: 85, column: 20, scope: !110)
!127 = !DILocation(line: 85, column: 18, scope: !110)
!128 = !DILocalVariable(name: "i", scope: !129, file: !17, line: 89, type: !45)
!129 = distinct !DILexicalBlock(scope: !105, file: !17, line: 88, column: 5)
!130 = !DILocation(line: 89, column: 16, scope: !129)
!131 = !DILocalVariable(name: "source", scope: !129, file: !17, line: 90, type: !49)
!132 = !DILocation(line: 90, column: 17, scope: !129)
!133 = !DILocation(line: 91, column: 17, scope: !129)
!134 = !DILocation(line: 91, column: 9, scope: !129)
!135 = !DILocation(line: 92, column: 9, scope: !129)
!136 = !DILocation(line: 92, column: 23, scope: !129)
!137 = !DILocation(line: 94, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !129, file: !17, line: 94, column: 9)
!139 = !DILocation(line: 94, column: 14, scope: !138)
!140 = !DILocation(line: 94, column: 21, scope: !141)
!141 = distinct !DILexicalBlock(scope: !138, file: !17, line: 94, column: 9)
!142 = !DILocation(line: 94, column: 23, scope: !141)
!143 = !DILocation(line: 94, column: 9, scope: !138)
!144 = !DILocation(line: 96, column: 30, scope: !145)
!145 = distinct !DILexicalBlock(scope: !141, file: !17, line: 95, column: 9)
!146 = !DILocation(line: 96, column: 23, scope: !145)
!147 = !DILocation(line: 96, column: 13, scope: !145)
!148 = !DILocation(line: 96, column: 18, scope: !145)
!149 = !DILocation(line: 96, column: 21, scope: !145)
!150 = !DILocation(line: 97, column: 9, scope: !145)
!151 = !DILocation(line: 94, column: 31, scope: !141)
!152 = !DILocation(line: 94, column: 9, scope: !141)
!153 = distinct !{!153, !143, !154, !75}
!154 = !DILocation(line: 97, column: 9, scope: !138)
!155 = !DILocation(line: 99, column: 9, scope: !129)
!156 = !DILocation(line: 99, column: 21, scope: !129)
!157 = !DILocation(line: 100, column: 20, scope: !129)
!158 = !DILocation(line: 100, column: 9, scope: !129)
!159 = !DILocation(line: 104, column: 1, scope: !105)
!160 = distinct !DISubprogram(name: "goodG2B2", scope: !17, file: !17, line: 107, type: !18, scopeLine: 108, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!161 = !DILocalVariable(name: "data", scope: !160, file: !17, line: 109, type: !4)
!162 = !DILocation(line: 109, column: 15, scope: !160)
!163 = !DILocation(line: 110, column: 10, scope: !160)
!164 = !DILocalVariable(name: "dataBuffer", scope: !165, file: !17, line: 114, type: !4)
!165 = distinct !DILexicalBlock(scope: !166, file: !17, line: 113, column: 9)
!166 = distinct !DILexicalBlock(scope: !167, file: !17, line: 112, column: 5)
!167 = distinct !DILexicalBlock(scope: !160, file: !17, line: 111, column: 8)
!168 = !DILocation(line: 114, column: 23, scope: !165)
!169 = !DILocation(line: 114, column: 47, scope: !165)
!170 = !DILocation(line: 114, column: 36, scope: !165)
!171 = !DILocation(line: 115, column: 17, scope: !172)
!172 = distinct !DILexicalBlock(scope: !165, file: !17, line: 115, column: 17)
!173 = !DILocation(line: 115, column: 28, scope: !172)
!174 = !DILocation(line: 115, column: 17, scope: !165)
!175 = !DILocation(line: 115, column: 38, scope: !176)
!176 = distinct !DILexicalBlock(scope: !172, file: !17, line: 115, column: 37)
!177 = !DILocation(line: 116, column: 21, scope: !165)
!178 = !DILocation(line: 116, column: 13, scope: !165)
!179 = !DILocation(line: 117, column: 13, scope: !165)
!180 = !DILocation(line: 117, column: 31, scope: !165)
!181 = !DILocation(line: 119, column: 20, scope: !165)
!182 = !DILocation(line: 119, column: 18, scope: !165)
!183 = !DILocalVariable(name: "i", scope: !184, file: !17, line: 123, type: !45)
!184 = distinct !DILexicalBlock(scope: !160, file: !17, line: 122, column: 5)
!185 = !DILocation(line: 123, column: 16, scope: !184)
!186 = !DILocalVariable(name: "source", scope: !184, file: !17, line: 124, type: !49)
!187 = !DILocation(line: 124, column: 17, scope: !184)
!188 = !DILocation(line: 125, column: 17, scope: !184)
!189 = !DILocation(line: 125, column: 9, scope: !184)
!190 = !DILocation(line: 126, column: 9, scope: !184)
!191 = !DILocation(line: 126, column: 23, scope: !184)
!192 = !DILocation(line: 128, column: 16, scope: !193)
!193 = distinct !DILexicalBlock(scope: !184, file: !17, line: 128, column: 9)
!194 = !DILocation(line: 128, column: 14, scope: !193)
!195 = !DILocation(line: 128, column: 21, scope: !196)
!196 = distinct !DILexicalBlock(scope: !193, file: !17, line: 128, column: 9)
!197 = !DILocation(line: 128, column: 23, scope: !196)
!198 = !DILocation(line: 128, column: 9, scope: !193)
!199 = !DILocation(line: 130, column: 30, scope: !200)
!200 = distinct !DILexicalBlock(scope: !196, file: !17, line: 129, column: 9)
!201 = !DILocation(line: 130, column: 23, scope: !200)
!202 = !DILocation(line: 130, column: 13, scope: !200)
!203 = !DILocation(line: 130, column: 18, scope: !200)
!204 = !DILocation(line: 130, column: 21, scope: !200)
!205 = !DILocation(line: 131, column: 9, scope: !200)
!206 = !DILocation(line: 128, column: 31, scope: !196)
!207 = !DILocation(line: 128, column: 9, scope: !196)
!208 = distinct !{!208, !198, !209, !75}
!209 = !DILocation(line: 131, column: 9, scope: !193)
!210 = !DILocation(line: 133, column: 9, scope: !184)
!211 = !DILocation(line: 133, column: 21, scope: !184)
!212 = !DILocation(line: 134, column: 20, scope: !184)
!213 = !DILocation(line: 134, column: 9, scope: !184)
!214 = !DILocation(line: 138, column: 1, scope: !160)
