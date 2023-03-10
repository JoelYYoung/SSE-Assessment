; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_12.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_12_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataBuffer4 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.else, !dbg !25

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !26, metadata !DIExpression()), !dbg !29
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !30
  %0 = bitcast i8* %call1 to i32*, !dbg !31
  store i32* %0, i32** %dataBuffer, align 8, !dbg !29
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !32
  %cmp = icmp eq i32* %1, null, !dbg !34
  br i1 %cmp, label %if.then2, label %if.end, !dbg !35

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !36
  unreachable, !dbg !36

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !38
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !39
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !40
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !40
  store i32 0, i32* %arrayidx, align 4, !dbg !41
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !42
  %add.ptr = getelementptr inbounds i32, i32* %4, i64 -8, !dbg !43
  store i32* %add.ptr, i32** %data, align 8, !dbg !44
  br label %if.end11, !dbg !45

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer4, metadata !46, metadata !DIExpression()), !dbg !49
  %call5 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !50
  %5 = bitcast i8* %call5 to i32*, !dbg !51
  store i32* %5, i32** %dataBuffer4, align 8, !dbg !49
  %6 = load i32*, i32** %dataBuffer4, align 8, !dbg !52
  %cmp6 = icmp eq i32* %6, null, !dbg !54
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !55

if.then7:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !56
  unreachable, !dbg !56

if.end8:                                          ; preds = %if.else
  %7 = load i32*, i32** %dataBuffer4, align 8, !dbg !58
  %call9 = call i32* @wmemset(i32* %7, i32 65, i64 99) #5, !dbg !59
  %8 = load i32*, i32** %dataBuffer4, align 8, !dbg !60
  %arrayidx10 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !60
  store i32 0, i32* %arrayidx10, align 4, !dbg !61
  %9 = load i32*, i32** %dataBuffer4, align 8, !dbg !62
  store i32* %9, i32** %data, align 8, !dbg !63
  br label %if.end11

if.end11:                                         ; preds = %if.end8, %if.end
  call void @llvm.dbg.declare(metadata i64* %i, metadata !64, metadata !DIExpression()), !dbg !68
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !69, metadata !DIExpression()), !dbg !73
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !74
  %call12 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !75
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !76
  store i32 0, i32* %arrayidx13, align 4, !dbg !77
  store i64 0, i64* %i, align 8, !dbg !78
  br label %for.cond, !dbg !80

for.cond:                                         ; preds = %for.inc, %if.end11
  %10 = load i64, i64* %i, align 8, !dbg !81
  %cmp14 = icmp ult i64 %10, 100, !dbg !83
  br i1 %cmp14, label %for.body, label %for.end, !dbg !84

for.body:                                         ; preds = %for.cond
  %11 = load i64, i64* %i, align 8, !dbg !85
  %arrayidx15 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %11, !dbg !87
  %12 = load i32, i32* %arrayidx15, align 4, !dbg !87
  %13 = load i32*, i32** %data, align 8, !dbg !88
  %14 = load i64, i64* %i, align 8, !dbg !89
  %arrayidx16 = getelementptr inbounds i32, i32* %13, i64 %14, !dbg !88
  store i32 %12, i32* %arrayidx16, align 4, !dbg !90
  br label %for.inc, !dbg !91

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !92
  %inc = add i64 %15, 1, !dbg !92
  store i64 %inc, i64* %i, align 8, !dbg !92
  br label %for.cond, !dbg !93, !llvm.loop !94

for.end:                                          ; preds = %for.cond
  %16 = load i32*, i32** %data, align 8, !dbg !97
  %arrayidx17 = getelementptr inbounds i32, i32* %16, i64 99, !dbg !97
  store i32 0, i32* %arrayidx17, align 4, !dbg !98
  %17 = load i32*, i32** %data, align 8, !dbg !99
  call void @printWLine(i32* %17), !dbg !100
  ret void, !dbg !101
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @globalReturnsTrueOrFalse(...) #2

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #3

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #4

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #3

declare dso_local void @printWLine(i32*) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_12_good() #0 !dbg !102 {
entry:
  call void @goodG2B(), !dbg !103
  ret void, !dbg !104
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !105 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !111, metadata !DIExpression()), !dbg !112
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !113, metadata !DIExpression()), !dbg !114
  %call = call i64 @time(i64* null) #5, !dbg !115
  %conv = trunc i64 %call to i32, !dbg !116
  call void @srand(i32 %conv) #5, !dbg !117
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !118
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_12_good(), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !120
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !121
  call void @CWE124_Buffer_Underwrite__malloc_wchar_t_loop_12_bad(), !dbg !122
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !123
  ret i32 0, !dbg !124
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !125 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca i32*, align 8
  %dataBuffer4 = alloca i32*, align 8
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !126, metadata !DIExpression()), !dbg !127
  store i32* null, i32** %data, align 8, !dbg !128
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !129
  %tobool = icmp ne i32 %call, 0, !dbg !129
  br i1 %tobool, label %if.then, label %if.else, !dbg !131

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer, metadata !132, metadata !DIExpression()), !dbg !135
  %call1 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !136
  %0 = bitcast i8* %call1 to i32*, !dbg !137
  store i32* %0, i32** %dataBuffer, align 8, !dbg !135
  %1 = load i32*, i32** %dataBuffer, align 8, !dbg !138
  %cmp = icmp eq i32* %1, null, !dbg !140
  br i1 %cmp, label %if.then2, label %if.end, !dbg !141

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #6, !dbg !142
  unreachable, !dbg !142

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %dataBuffer, align 8, !dbg !144
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #5, !dbg !145
  %3 = load i32*, i32** %dataBuffer, align 8, !dbg !146
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !146
  store i32 0, i32* %arrayidx, align 4, !dbg !147
  %4 = load i32*, i32** %dataBuffer, align 8, !dbg !148
  store i32* %4, i32** %data, align 8, !dbg !149
  br label %if.end11, !dbg !150

if.else:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32** %dataBuffer4, metadata !151, metadata !DIExpression()), !dbg !154
  %call5 = call noalias align 16 i8* @malloc(i64 400) #5, !dbg !155
  %5 = bitcast i8* %call5 to i32*, !dbg !156
  store i32* %5, i32** %dataBuffer4, align 8, !dbg !154
  %6 = load i32*, i32** %dataBuffer4, align 8, !dbg !157
  %cmp6 = icmp eq i32* %6, null, !dbg !159
  br i1 %cmp6, label %if.then7, label %if.end8, !dbg !160

if.then7:                                         ; preds = %if.else
  call void @exit(i32 -1) #6, !dbg !161
  unreachable, !dbg !161

if.end8:                                          ; preds = %if.else
  %7 = load i32*, i32** %dataBuffer4, align 8, !dbg !163
  %call9 = call i32* @wmemset(i32* %7, i32 65, i64 99) #5, !dbg !164
  %8 = load i32*, i32** %dataBuffer4, align 8, !dbg !165
  %arrayidx10 = getelementptr inbounds i32, i32* %8, i64 99, !dbg !165
  store i32 0, i32* %arrayidx10, align 4, !dbg !166
  %9 = load i32*, i32** %dataBuffer4, align 8, !dbg !167
  store i32* %9, i32** %data, align 8, !dbg !168
  br label %if.end11

if.end11:                                         ; preds = %if.end8, %if.end
  call void @llvm.dbg.declare(metadata i64* %i, metadata !169, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !172, metadata !DIExpression()), !dbg !173
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !174
  %call12 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #5, !dbg !175
  %arrayidx13 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !176
  store i32 0, i32* %arrayidx13, align 4, !dbg !177
  store i64 0, i64* %i, align 8, !dbg !178
  br label %for.cond, !dbg !180

for.cond:                                         ; preds = %for.inc, %if.end11
  %10 = load i64, i64* %i, align 8, !dbg !181
  %cmp14 = icmp ult i64 %10, 100, !dbg !183
  br i1 %cmp14, label %for.body, label %for.end, !dbg !184

for.body:                                         ; preds = %for.cond
  %11 = load i64, i64* %i, align 8, !dbg !185
  %arrayidx15 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %11, !dbg !187
  %12 = load i32, i32* %arrayidx15, align 4, !dbg !187
  %13 = load i32*, i32** %data, align 8, !dbg !188
  %14 = load i64, i64* %i, align 8, !dbg !189
  %arrayidx16 = getelementptr inbounds i32, i32* %13, i64 %14, !dbg !188
  store i32 %12, i32* %arrayidx16, align 4, !dbg !190
  br label %for.inc, !dbg !191

for.inc:                                          ; preds = %for.body
  %15 = load i64, i64* %i, align 8, !dbg !192
  %inc = add i64 %15, 1, !dbg !192
  store i64 %inc, i64* %i, align 8, !dbg !192
  br label %for.cond, !dbg !193, !llvm.loop !194

for.end:                                          ; preds = %for.cond
  %16 = load i32*, i32** %data, align 8, !dbg !196
  %arrayidx17 = getelementptr inbounds i32, i32* %16, i64 99, !dbg !196
  store i32 0, i32* %arrayidx17, align 4, !dbg !197
  %17 = load i32*, i32** %data, align 8, !dbg !198
  call void @printWLine(i32* %17), !dbg !199
  ret void, !dbg !200
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
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
!16 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_12_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__malloc_wchar_t_loop_12.c", directory: "/home/joelyang/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 8, scope: !16)
!26 = !DILocalVariable(name: "dataBuffer", scope: !27, file: !17, line: 30, type: !4)
!27 = distinct !DILexicalBlock(scope: !28, file: !17, line: 29, column: 9)
!28 = distinct !DILexicalBlock(scope: !24, file: !17, line: 28, column: 5)
!29 = !DILocation(line: 30, column: 23, scope: !27)
!30 = !DILocation(line: 30, column: 47, scope: !27)
!31 = !DILocation(line: 30, column: 36, scope: !27)
!32 = !DILocation(line: 31, column: 17, scope: !33)
!33 = distinct !DILexicalBlock(scope: !27, file: !17, line: 31, column: 17)
!34 = !DILocation(line: 31, column: 28, scope: !33)
!35 = !DILocation(line: 31, column: 17, scope: !27)
!36 = !DILocation(line: 31, column: 38, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !17, line: 31, column: 37)
!38 = !DILocation(line: 32, column: 21, scope: !27)
!39 = !DILocation(line: 32, column: 13, scope: !27)
!40 = !DILocation(line: 33, column: 13, scope: !27)
!41 = !DILocation(line: 33, column: 31, scope: !27)
!42 = !DILocation(line: 35, column: 20, scope: !27)
!43 = !DILocation(line: 35, column: 31, scope: !27)
!44 = !DILocation(line: 35, column: 18, scope: !27)
!45 = !DILocation(line: 37, column: 5, scope: !28)
!46 = !DILocalVariable(name: "dataBuffer", scope: !47, file: !17, line: 41, type: !4)
!47 = distinct !DILexicalBlock(scope: !48, file: !17, line: 40, column: 9)
!48 = distinct !DILexicalBlock(scope: !24, file: !17, line: 39, column: 5)
!49 = !DILocation(line: 41, column: 23, scope: !47)
!50 = !DILocation(line: 41, column: 47, scope: !47)
!51 = !DILocation(line: 41, column: 36, scope: !47)
!52 = !DILocation(line: 42, column: 17, scope: !53)
!53 = distinct !DILexicalBlock(scope: !47, file: !17, line: 42, column: 17)
!54 = !DILocation(line: 42, column: 28, scope: !53)
!55 = !DILocation(line: 42, column: 17, scope: !47)
!56 = !DILocation(line: 42, column: 38, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !17, line: 42, column: 37)
!58 = !DILocation(line: 43, column: 21, scope: !47)
!59 = !DILocation(line: 43, column: 13, scope: !47)
!60 = !DILocation(line: 44, column: 13, scope: !47)
!61 = !DILocation(line: 44, column: 31, scope: !47)
!62 = !DILocation(line: 46, column: 20, scope: !47)
!63 = !DILocation(line: 46, column: 18, scope: !47)
!64 = !DILocalVariable(name: "i", scope: !65, file: !17, line: 50, type: !66)
!65 = distinct !DILexicalBlock(scope: !16, file: !17, line: 49, column: 5)
!66 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !67)
!67 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!68 = !DILocation(line: 50, column: 16, scope: !65)
!69 = !DILocalVariable(name: "source", scope: !65, file: !17, line: 51, type: !70)
!70 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !71)
!71 = !{!72}
!72 = !DISubrange(count: 100)
!73 = !DILocation(line: 51, column: 17, scope: !65)
!74 = !DILocation(line: 52, column: 17, scope: !65)
!75 = !DILocation(line: 52, column: 9, scope: !65)
!76 = !DILocation(line: 53, column: 9, scope: !65)
!77 = !DILocation(line: 53, column: 23, scope: !65)
!78 = !DILocation(line: 55, column: 16, scope: !79)
!79 = distinct !DILexicalBlock(scope: !65, file: !17, line: 55, column: 9)
!80 = !DILocation(line: 55, column: 14, scope: !79)
!81 = !DILocation(line: 55, column: 21, scope: !82)
!82 = distinct !DILexicalBlock(scope: !79, file: !17, line: 55, column: 9)
!83 = !DILocation(line: 55, column: 23, scope: !82)
!84 = !DILocation(line: 55, column: 9, scope: !79)
!85 = !DILocation(line: 57, column: 30, scope: !86)
!86 = distinct !DILexicalBlock(scope: !82, file: !17, line: 56, column: 9)
!87 = !DILocation(line: 57, column: 23, scope: !86)
!88 = !DILocation(line: 57, column: 13, scope: !86)
!89 = !DILocation(line: 57, column: 18, scope: !86)
!90 = !DILocation(line: 57, column: 21, scope: !86)
!91 = !DILocation(line: 58, column: 9, scope: !86)
!92 = !DILocation(line: 55, column: 31, scope: !82)
!93 = !DILocation(line: 55, column: 9, scope: !82)
!94 = distinct !{!94, !84, !95, !96}
!95 = !DILocation(line: 58, column: 9, scope: !79)
!96 = !{!"llvm.loop.mustprogress"}
!97 = !DILocation(line: 60, column: 9, scope: !65)
!98 = !DILocation(line: 60, column: 21, scope: !65)
!99 = !DILocation(line: 61, column: 20, scope: !65)
!100 = !DILocation(line: 61, column: 9, scope: !65)
!101 = !DILocation(line: 65, column: 1, scope: !16)
!102 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__malloc_wchar_t_loop_12_good", scope: !17, file: !17, line: 117, type: !18, scopeLine: 118, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!103 = !DILocation(line: 119, column: 5, scope: !102)
!104 = !DILocation(line: 120, column: 1, scope: !102)
!105 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 132, type: !106, scopeLine: 133, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!106 = !DISubroutineType(types: !107)
!107 = !{!7, !7, !108}
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !110, size: 64)
!110 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!111 = !DILocalVariable(name: "argc", arg: 1, scope: !105, file: !17, line: 132, type: !7)
!112 = !DILocation(line: 132, column: 14, scope: !105)
!113 = !DILocalVariable(name: "argv", arg: 2, scope: !105, file: !17, line: 132, type: !108)
!114 = !DILocation(line: 132, column: 27, scope: !105)
!115 = !DILocation(line: 135, column: 22, scope: !105)
!116 = !DILocation(line: 135, column: 12, scope: !105)
!117 = !DILocation(line: 135, column: 5, scope: !105)
!118 = !DILocation(line: 137, column: 5, scope: !105)
!119 = !DILocation(line: 138, column: 5, scope: !105)
!120 = !DILocation(line: 139, column: 5, scope: !105)
!121 = !DILocation(line: 142, column: 5, scope: !105)
!122 = !DILocation(line: 143, column: 5, scope: !105)
!123 = !DILocation(line: 144, column: 5, scope: !105)
!124 = !DILocation(line: 146, column: 5, scope: !105)
!125 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 73, type: !18, scopeLine: 74, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!126 = !DILocalVariable(name: "data", scope: !125, file: !17, line: 75, type: !4)
!127 = !DILocation(line: 75, column: 15, scope: !125)
!128 = !DILocation(line: 76, column: 10, scope: !125)
!129 = !DILocation(line: 77, column: 8, scope: !130)
!130 = distinct !DILexicalBlock(scope: !125, file: !17, line: 77, column: 8)
!131 = !DILocation(line: 77, column: 8, scope: !125)
!132 = !DILocalVariable(name: "dataBuffer", scope: !133, file: !17, line: 80, type: !4)
!133 = distinct !DILexicalBlock(scope: !134, file: !17, line: 79, column: 9)
!134 = distinct !DILexicalBlock(scope: !130, file: !17, line: 78, column: 5)
!135 = !DILocation(line: 80, column: 23, scope: !133)
!136 = !DILocation(line: 80, column: 47, scope: !133)
!137 = !DILocation(line: 80, column: 36, scope: !133)
!138 = !DILocation(line: 81, column: 17, scope: !139)
!139 = distinct !DILexicalBlock(scope: !133, file: !17, line: 81, column: 17)
!140 = !DILocation(line: 81, column: 28, scope: !139)
!141 = !DILocation(line: 81, column: 17, scope: !133)
!142 = !DILocation(line: 81, column: 38, scope: !143)
!143 = distinct !DILexicalBlock(scope: !139, file: !17, line: 81, column: 37)
!144 = !DILocation(line: 82, column: 21, scope: !133)
!145 = !DILocation(line: 82, column: 13, scope: !133)
!146 = !DILocation(line: 83, column: 13, scope: !133)
!147 = !DILocation(line: 83, column: 31, scope: !133)
!148 = !DILocation(line: 85, column: 20, scope: !133)
!149 = !DILocation(line: 85, column: 18, scope: !133)
!150 = !DILocation(line: 87, column: 5, scope: !134)
!151 = !DILocalVariable(name: "dataBuffer", scope: !152, file: !17, line: 91, type: !4)
!152 = distinct !DILexicalBlock(scope: !153, file: !17, line: 90, column: 9)
!153 = distinct !DILexicalBlock(scope: !130, file: !17, line: 89, column: 5)
!154 = !DILocation(line: 91, column: 23, scope: !152)
!155 = !DILocation(line: 91, column: 47, scope: !152)
!156 = !DILocation(line: 91, column: 36, scope: !152)
!157 = !DILocation(line: 92, column: 17, scope: !158)
!158 = distinct !DILexicalBlock(scope: !152, file: !17, line: 92, column: 17)
!159 = !DILocation(line: 92, column: 28, scope: !158)
!160 = !DILocation(line: 92, column: 17, scope: !152)
!161 = !DILocation(line: 92, column: 38, scope: !162)
!162 = distinct !DILexicalBlock(scope: !158, file: !17, line: 92, column: 37)
!163 = !DILocation(line: 93, column: 21, scope: !152)
!164 = !DILocation(line: 93, column: 13, scope: !152)
!165 = !DILocation(line: 94, column: 13, scope: !152)
!166 = !DILocation(line: 94, column: 31, scope: !152)
!167 = !DILocation(line: 96, column: 20, scope: !152)
!168 = !DILocation(line: 96, column: 18, scope: !152)
!169 = !DILocalVariable(name: "i", scope: !170, file: !17, line: 100, type: !66)
!170 = distinct !DILexicalBlock(scope: !125, file: !17, line: 99, column: 5)
!171 = !DILocation(line: 100, column: 16, scope: !170)
!172 = !DILocalVariable(name: "source", scope: !170, file: !17, line: 101, type: !70)
!173 = !DILocation(line: 101, column: 17, scope: !170)
!174 = !DILocation(line: 102, column: 17, scope: !170)
!175 = !DILocation(line: 102, column: 9, scope: !170)
!176 = !DILocation(line: 103, column: 9, scope: !170)
!177 = !DILocation(line: 103, column: 23, scope: !170)
!178 = !DILocation(line: 105, column: 16, scope: !179)
!179 = distinct !DILexicalBlock(scope: !170, file: !17, line: 105, column: 9)
!180 = !DILocation(line: 105, column: 14, scope: !179)
!181 = !DILocation(line: 105, column: 21, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !17, line: 105, column: 9)
!183 = !DILocation(line: 105, column: 23, scope: !182)
!184 = !DILocation(line: 105, column: 9, scope: !179)
!185 = !DILocation(line: 107, column: 30, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !17, line: 106, column: 9)
!187 = !DILocation(line: 107, column: 23, scope: !186)
!188 = !DILocation(line: 107, column: 13, scope: !186)
!189 = !DILocation(line: 107, column: 18, scope: !186)
!190 = !DILocation(line: 107, column: 21, scope: !186)
!191 = !DILocation(line: 108, column: 9, scope: !186)
!192 = !DILocation(line: 105, column: 31, scope: !182)
!193 = !DILocation(line: 105, column: 9, scope: !182)
!194 = distinct !{!194, !184, !195, !96}
!195 = !DILocation(line: 108, column: 9, scope: !179)
!196 = !DILocation(line: 110, column: 9, scope: !170)
!197 = !DILocation(line: 110, column: 21, scope: !170)
!198 = !DILocation(line: 111, column: 20, scope: !170)
!199 = !DILocation(line: 111, column: 9, scope: !170)
!200 = !DILocation(line: 115, column: 1, scope: !125)
