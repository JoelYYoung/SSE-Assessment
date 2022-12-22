; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_12.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_12.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_12_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !20, metadata !DIExpression()), !dbg !21
  store i32* null, i32** %data, align 8, !dbg !22
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !23
  %tobool = icmp ne i32 %call, 0, !dbg !23
  br i1 %tobool, label %if.then, label %if.else, !dbg !25

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 200) #6, !dbg !26
  %0 = bitcast i8* %call1 to i32*, !dbg !28
  store i32* %0, i32** %data, align 8, !dbg !29
  %1 = load i32*, i32** %data, align 8, !dbg !30
  %cmp = icmp eq i32* %1, null, !dbg !32
  br i1 %cmp, label %if.then2, label %if.end, !dbg !33

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !34
  unreachable, !dbg !34

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !36
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 49) #6, !dbg !37
  %3 = load i32*, i32** %data, align 8, !dbg !38
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 49, !dbg !38
  store i32 0, i32* %arrayidx, align 4, !dbg !39
  br label %if.end10, !dbg !40

if.else:                                          ; preds = %entry
  %call4 = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !41
  %4 = bitcast i8* %call4 to i32*, !dbg !43
  store i32* %4, i32** %data, align 8, !dbg !44
  %5 = load i32*, i32** %data, align 8, !dbg !45
  %cmp5 = icmp eq i32* %5, null, !dbg !47
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !48

if.then6:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !49
  unreachable, !dbg !49

if.end7:                                          ; preds = %if.else
  %6 = load i32*, i32** %data, align 8, !dbg !51
  %call8 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !52
  %7 = load i32*, i32** %data, align 8, !dbg !53
  %arrayidx9 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !53
  store i32 0, i32* %arrayidx9, align 4, !dbg !54
  br label %if.end10

if.end10:                                         ; preds = %if.end7, %if.end
  call void @llvm.dbg.declare(metadata i64* %i, metadata !55, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !62, metadata !DIExpression()), !dbg !66
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !67
  %call11 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !68
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !69
  store i32 0, i32* %arrayidx12, align 4, !dbg !70
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !71
  %call14 = call i64 @wcslen(i32* %arraydecay13) #8, !dbg !72
  store i64 %call14, i64* %destLen, align 8, !dbg !73
  store i64 0, i64* %i, align 8, !dbg !74
  br label %for.cond, !dbg !76

for.cond:                                         ; preds = %for.inc, %if.end10
  %8 = load i64, i64* %i, align 8, !dbg !77
  %9 = load i64, i64* %destLen, align 8, !dbg !79
  %cmp15 = icmp ult i64 %8, %9, !dbg !80
  br i1 %cmp15, label %for.body, label %for.end, !dbg !81

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !82
  %11 = load i64, i64* %i, align 8, !dbg !84
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !82
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !82
  %13 = load i64, i64* %i, align 8, !dbg !85
  %arrayidx17 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %13, !dbg !86
  store i32 %12, i32* %arrayidx17, align 4, !dbg !87
  br label %for.inc, !dbg !88

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !89
  %inc = add i64 %14, 1, !dbg !89
  store i64 %inc, i64* %i, align 8, !dbg !89
  br label %for.cond, !dbg !90, !llvm.loop !91

for.end:                                          ; preds = %for.cond
  %arrayidx18 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !94
  store i32 0, i32* %arrayidx18, align 4, !dbg !95
  %arraydecay19 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !96
  call void @printWLine(i32* %arraydecay19), !dbg !97
  %15 = load i32*, i32** %data, align 8, !dbg !98
  %16 = bitcast i32* %15 to i8*, !dbg !98
  call void @free(i8* %16) #6, !dbg !99
  ret void, !dbg !100
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

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #5

declare dso_local void @printWLine(i32*) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__malloc_wchar_t_loop_12_good() #0 !dbg !101 {
entry:
  call void @goodG2B(), !dbg !102
  ret void, !dbg !103
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !104 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !110, metadata !DIExpression()), !dbg !111
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !112, metadata !DIExpression()), !dbg !113
  %call = call i64 @time(i64* null) #6, !dbg !114
  %conv = trunc i64 %call to i32, !dbg !115
  call void @srand(i32 %conv) #6, !dbg !116
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !117
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_12_good(), !dbg !118
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !119
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !120
  call void @CWE126_Buffer_Overread__malloc_wchar_t_loop_12_bad(), !dbg !121
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !122
  ret i32 0, !dbg !123
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #3

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #3

declare dso_local void @printLine(i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !124 {
entry:
  %data = alloca i32*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !125, metadata !DIExpression()), !dbg !126
  store i32* null, i32** %data, align 8, !dbg !127
  %call = call i32 (...) @globalReturnsTrueOrFalse(), !dbg !128
  %tobool = icmp ne i32 %call, 0, !dbg !128
  br i1 %tobool, label %if.then, label %if.else, !dbg !130

if.then:                                          ; preds = %entry
  %call1 = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !131
  %0 = bitcast i8* %call1 to i32*, !dbg !133
  store i32* %0, i32** %data, align 8, !dbg !134
  %1 = load i32*, i32** %data, align 8, !dbg !135
  %cmp = icmp eq i32* %1, null, !dbg !137
  br i1 %cmp, label %if.then2, label %if.end, !dbg !138

if.then2:                                         ; preds = %if.then
  call void @exit(i32 -1) #7, !dbg !139
  unreachable, !dbg !139

if.end:                                           ; preds = %if.then
  %2 = load i32*, i32** %data, align 8, !dbg !141
  %call3 = call i32* @wmemset(i32* %2, i32 65, i64 99) #6, !dbg !142
  %3 = load i32*, i32** %data, align 8, !dbg !143
  %arrayidx = getelementptr inbounds i32, i32* %3, i64 99, !dbg !143
  store i32 0, i32* %arrayidx, align 4, !dbg !144
  br label %if.end10, !dbg !145

if.else:                                          ; preds = %entry
  %call4 = call noalias align 16 i8* @malloc(i64 400) #6, !dbg !146
  %4 = bitcast i8* %call4 to i32*, !dbg !148
  store i32* %4, i32** %data, align 8, !dbg !149
  %5 = load i32*, i32** %data, align 8, !dbg !150
  %cmp5 = icmp eq i32* %5, null, !dbg !152
  br i1 %cmp5, label %if.then6, label %if.end7, !dbg !153

if.then6:                                         ; preds = %if.else
  call void @exit(i32 -1) #7, !dbg !154
  unreachable, !dbg !154

if.end7:                                          ; preds = %if.else
  %6 = load i32*, i32** %data, align 8, !dbg !156
  %call8 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !157
  %7 = load i32*, i32** %data, align 8, !dbg !158
  %arrayidx9 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !158
  store i32 0, i32* %arrayidx9, align 4, !dbg !159
  br label %if.end10

if.end10:                                         ; preds = %if.end7, %if.end
  call void @llvm.dbg.declare(metadata i64* %i, metadata !160, metadata !DIExpression()), !dbg !162
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !163, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !165, metadata !DIExpression()), !dbg !166
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !167
  %call11 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !168
  %arrayidx12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !169
  store i32 0, i32* %arrayidx12, align 4, !dbg !170
  %arraydecay13 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !171
  %call14 = call i64 @wcslen(i32* %arraydecay13) #8, !dbg !172
  store i64 %call14, i64* %destLen, align 8, !dbg !173
  store i64 0, i64* %i, align 8, !dbg !174
  br label %for.cond, !dbg !176

for.cond:                                         ; preds = %for.inc, %if.end10
  %8 = load i64, i64* %i, align 8, !dbg !177
  %9 = load i64, i64* %destLen, align 8, !dbg !179
  %cmp15 = icmp ult i64 %8, %9, !dbg !180
  br i1 %cmp15, label %for.body, label %for.end, !dbg !181

for.body:                                         ; preds = %for.cond
  %10 = load i32*, i32** %data, align 8, !dbg !182
  %11 = load i64, i64* %i, align 8, !dbg !184
  %arrayidx16 = getelementptr inbounds i32, i32* %10, i64 %11, !dbg !182
  %12 = load i32, i32* %arrayidx16, align 4, !dbg !182
  %13 = load i64, i64* %i, align 8, !dbg !185
  %arrayidx17 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %13, !dbg !186
  store i32 %12, i32* %arrayidx17, align 4, !dbg !187
  br label %for.inc, !dbg !188

for.inc:                                          ; preds = %for.body
  %14 = load i64, i64* %i, align 8, !dbg !189
  %inc = add i64 %14, 1, !dbg !189
  store i64 %inc, i64* %i, align 8, !dbg !189
  br label %for.cond, !dbg !190, !llvm.loop !191

for.end:                                          ; preds = %for.cond
  %arrayidx18 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !193
  store i32 0, i32* %arrayidx18, align 4, !dbg !194
  %arraydecay19 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !195
  call void @printWLine(i32* %arraydecay19), !dbg !196
  %15 = load i32*, i32** %data, align 8, !dbg !197
  %16 = bitcast i32* %15 to i8*, !dbg !197
  call void @free(i8* %16) #6, !dbg !198
  ret void, !dbg !199
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_12.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8, !9}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!9 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_12_bad", scope: !17, file: !17, line: 23, type: !18, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__malloc_wchar_t_loop_12.c", directory: "/root/SSE-Assessment")
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "data", scope: !16, file: !17, line: 25, type: !4)
!21 = !DILocation(line: 25, column: 15, scope: !16)
!22 = !DILocation(line: 26, column: 10, scope: !16)
!23 = !DILocation(line: 27, column: 8, scope: !24)
!24 = distinct !DILexicalBlock(scope: !16, file: !17, line: 27, column: 8)
!25 = !DILocation(line: 27, column: 8, scope: !16)
!26 = !DILocation(line: 30, column: 27, scope: !27)
!27 = distinct !DILexicalBlock(scope: !24, file: !17, line: 28, column: 5)
!28 = !DILocation(line: 30, column: 16, scope: !27)
!29 = !DILocation(line: 30, column: 14, scope: !27)
!30 = !DILocation(line: 31, column: 13, scope: !31)
!31 = distinct !DILexicalBlock(scope: !27, file: !17, line: 31, column: 13)
!32 = !DILocation(line: 31, column: 18, scope: !31)
!33 = !DILocation(line: 31, column: 13, scope: !27)
!34 = !DILocation(line: 31, column: 28, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !17, line: 31, column: 27)
!36 = !DILocation(line: 32, column: 17, scope: !27)
!37 = !DILocation(line: 32, column: 9, scope: !27)
!38 = !DILocation(line: 33, column: 9, scope: !27)
!39 = !DILocation(line: 33, column: 20, scope: !27)
!40 = !DILocation(line: 34, column: 5, scope: !27)
!41 = !DILocation(line: 38, column: 27, scope: !42)
!42 = distinct !DILexicalBlock(scope: !24, file: !17, line: 36, column: 5)
!43 = !DILocation(line: 38, column: 16, scope: !42)
!44 = !DILocation(line: 38, column: 14, scope: !42)
!45 = !DILocation(line: 39, column: 13, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !17, line: 39, column: 13)
!47 = !DILocation(line: 39, column: 18, scope: !46)
!48 = !DILocation(line: 39, column: 13, scope: !42)
!49 = !DILocation(line: 39, column: 28, scope: !50)
!50 = distinct !DILexicalBlock(scope: !46, file: !17, line: 39, column: 27)
!51 = !DILocation(line: 40, column: 17, scope: !42)
!52 = !DILocation(line: 40, column: 9, scope: !42)
!53 = !DILocation(line: 41, column: 9, scope: !42)
!54 = !DILocation(line: 41, column: 21, scope: !42)
!55 = !DILocalVariable(name: "i", scope: !56, file: !17, line: 44, type: !57)
!56 = distinct !DILexicalBlock(scope: !16, file: !17, line: 43, column: 5)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !6, line: 46, baseType: !58)
!58 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!59 = !DILocation(line: 44, column: 16, scope: !56)
!60 = !DILocalVariable(name: "destLen", scope: !56, file: !17, line: 44, type: !57)
!61 = !DILocation(line: 44, column: 19, scope: !56)
!62 = !DILocalVariable(name: "dest", scope: !56, file: !17, line: 45, type: !63)
!63 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !64)
!64 = !{!65}
!65 = !DISubrange(count: 100)
!66 = !DILocation(line: 45, column: 17, scope: !56)
!67 = !DILocation(line: 46, column: 17, scope: !56)
!68 = !DILocation(line: 46, column: 9, scope: !56)
!69 = !DILocation(line: 47, column: 9, scope: !56)
!70 = !DILocation(line: 47, column: 21, scope: !56)
!71 = !DILocation(line: 48, column: 26, scope: !56)
!72 = !DILocation(line: 48, column: 19, scope: !56)
!73 = !DILocation(line: 48, column: 17, scope: !56)
!74 = !DILocation(line: 51, column: 16, scope: !75)
!75 = distinct !DILexicalBlock(scope: !56, file: !17, line: 51, column: 9)
!76 = !DILocation(line: 51, column: 14, scope: !75)
!77 = !DILocation(line: 51, column: 21, scope: !78)
!78 = distinct !DILexicalBlock(scope: !75, file: !17, line: 51, column: 9)
!79 = !DILocation(line: 51, column: 25, scope: !78)
!80 = !DILocation(line: 51, column: 23, scope: !78)
!81 = !DILocation(line: 51, column: 9, scope: !75)
!82 = !DILocation(line: 53, column: 23, scope: !83)
!83 = distinct !DILexicalBlock(scope: !78, file: !17, line: 52, column: 9)
!84 = !DILocation(line: 53, column: 28, scope: !83)
!85 = !DILocation(line: 53, column: 18, scope: !83)
!86 = !DILocation(line: 53, column: 13, scope: !83)
!87 = !DILocation(line: 53, column: 21, scope: !83)
!88 = !DILocation(line: 54, column: 9, scope: !83)
!89 = !DILocation(line: 51, column: 35, scope: !78)
!90 = !DILocation(line: 51, column: 9, scope: !78)
!91 = distinct !{!91, !81, !92, !93}
!92 = !DILocation(line: 54, column: 9, scope: !75)
!93 = !{!"llvm.loop.mustprogress"}
!94 = !DILocation(line: 55, column: 9, scope: !56)
!95 = !DILocation(line: 55, column: 21, scope: !56)
!96 = !DILocation(line: 56, column: 20, scope: !56)
!97 = !DILocation(line: 56, column: 9, scope: !56)
!98 = !DILocation(line: 57, column: 14, scope: !56)
!99 = !DILocation(line: 57, column: 9, scope: !56)
!100 = !DILocation(line: 59, column: 1, scope: !16)
!101 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__malloc_wchar_t_loop_12_good", scope: !17, file: !17, line: 105, type: !18, scopeLine: 106, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocation(line: 107, column: 5, scope: !101)
!103 = !DILocation(line: 108, column: 1, scope: !101)
!104 = distinct !DISubprogram(name: "main", scope: !17, file: !17, line: 120, type: !105, scopeLine: 121, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!105 = !DISubroutineType(types: !106)
!106 = !{!7, !7, !107}
!107 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !108, size: 64)
!108 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !109, size: 64)
!109 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!110 = !DILocalVariable(name: "argc", arg: 1, scope: !104, file: !17, line: 120, type: !7)
!111 = !DILocation(line: 120, column: 14, scope: !104)
!112 = !DILocalVariable(name: "argv", arg: 2, scope: !104, file: !17, line: 120, type: !107)
!113 = !DILocation(line: 120, column: 27, scope: !104)
!114 = !DILocation(line: 123, column: 22, scope: !104)
!115 = !DILocation(line: 123, column: 12, scope: !104)
!116 = !DILocation(line: 123, column: 5, scope: !104)
!117 = !DILocation(line: 125, column: 5, scope: !104)
!118 = !DILocation(line: 126, column: 5, scope: !104)
!119 = !DILocation(line: 127, column: 5, scope: !104)
!120 = !DILocation(line: 130, column: 5, scope: !104)
!121 = !DILocation(line: 131, column: 5, scope: !104)
!122 = !DILocation(line: 132, column: 5, scope: !104)
!123 = !DILocation(line: 134, column: 5, scope: !104)
!124 = distinct !DISubprogram(name: "goodG2B", scope: !17, file: !17, line: 67, type: !18, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!125 = !DILocalVariable(name: "data", scope: !124, file: !17, line: 69, type: !4)
!126 = !DILocation(line: 69, column: 15, scope: !124)
!127 = !DILocation(line: 70, column: 10, scope: !124)
!128 = !DILocation(line: 71, column: 8, scope: !129)
!129 = distinct !DILexicalBlock(scope: !124, file: !17, line: 71, column: 8)
!130 = !DILocation(line: 71, column: 8, scope: !124)
!131 = !DILocation(line: 74, column: 27, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !17, line: 72, column: 5)
!133 = !DILocation(line: 74, column: 16, scope: !132)
!134 = !DILocation(line: 74, column: 14, scope: !132)
!135 = !DILocation(line: 75, column: 13, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !17, line: 75, column: 13)
!137 = !DILocation(line: 75, column: 18, scope: !136)
!138 = !DILocation(line: 75, column: 13, scope: !132)
!139 = !DILocation(line: 75, column: 28, scope: !140)
!140 = distinct !DILexicalBlock(scope: !136, file: !17, line: 75, column: 27)
!141 = !DILocation(line: 76, column: 17, scope: !132)
!142 = !DILocation(line: 76, column: 9, scope: !132)
!143 = !DILocation(line: 77, column: 9, scope: !132)
!144 = !DILocation(line: 77, column: 21, scope: !132)
!145 = !DILocation(line: 78, column: 5, scope: !132)
!146 = !DILocation(line: 82, column: 27, scope: !147)
!147 = distinct !DILexicalBlock(scope: !129, file: !17, line: 80, column: 5)
!148 = !DILocation(line: 82, column: 16, scope: !147)
!149 = !DILocation(line: 82, column: 14, scope: !147)
!150 = !DILocation(line: 83, column: 13, scope: !151)
!151 = distinct !DILexicalBlock(scope: !147, file: !17, line: 83, column: 13)
!152 = !DILocation(line: 83, column: 18, scope: !151)
!153 = !DILocation(line: 83, column: 13, scope: !147)
!154 = !DILocation(line: 83, column: 28, scope: !155)
!155 = distinct !DILexicalBlock(scope: !151, file: !17, line: 83, column: 27)
!156 = !DILocation(line: 84, column: 17, scope: !147)
!157 = !DILocation(line: 84, column: 9, scope: !147)
!158 = !DILocation(line: 85, column: 9, scope: !147)
!159 = !DILocation(line: 85, column: 21, scope: !147)
!160 = !DILocalVariable(name: "i", scope: !161, file: !17, line: 88, type: !57)
!161 = distinct !DILexicalBlock(scope: !124, file: !17, line: 87, column: 5)
!162 = !DILocation(line: 88, column: 16, scope: !161)
!163 = !DILocalVariable(name: "destLen", scope: !161, file: !17, line: 88, type: !57)
!164 = !DILocation(line: 88, column: 19, scope: !161)
!165 = !DILocalVariable(name: "dest", scope: !161, file: !17, line: 89, type: !63)
!166 = !DILocation(line: 89, column: 17, scope: !161)
!167 = !DILocation(line: 90, column: 17, scope: !161)
!168 = !DILocation(line: 90, column: 9, scope: !161)
!169 = !DILocation(line: 91, column: 9, scope: !161)
!170 = !DILocation(line: 91, column: 21, scope: !161)
!171 = !DILocation(line: 92, column: 26, scope: !161)
!172 = !DILocation(line: 92, column: 19, scope: !161)
!173 = !DILocation(line: 92, column: 17, scope: !161)
!174 = !DILocation(line: 95, column: 16, scope: !175)
!175 = distinct !DILexicalBlock(scope: !161, file: !17, line: 95, column: 9)
!176 = !DILocation(line: 95, column: 14, scope: !175)
!177 = !DILocation(line: 95, column: 21, scope: !178)
!178 = distinct !DILexicalBlock(scope: !175, file: !17, line: 95, column: 9)
!179 = !DILocation(line: 95, column: 25, scope: !178)
!180 = !DILocation(line: 95, column: 23, scope: !178)
!181 = !DILocation(line: 95, column: 9, scope: !175)
!182 = !DILocation(line: 97, column: 23, scope: !183)
!183 = distinct !DILexicalBlock(scope: !178, file: !17, line: 96, column: 9)
!184 = !DILocation(line: 97, column: 28, scope: !183)
!185 = !DILocation(line: 97, column: 18, scope: !183)
!186 = !DILocation(line: 97, column: 13, scope: !183)
!187 = !DILocation(line: 97, column: 21, scope: !183)
!188 = !DILocation(line: 98, column: 9, scope: !183)
!189 = !DILocation(line: 95, column: 35, scope: !178)
!190 = !DILocation(line: 95, column: 9, scope: !178)
!191 = distinct !{!191, !181, !192, !93}
!192 = !DILocation(line: 98, column: 9, scope: !175)
!193 = !DILocation(line: 99, column: 9, scope: !161)
!194 = !DILocation(line: 99, column: 21, scope: !161)
!195 = !DILocation(line: 100, column: 20, scope: !161)
!196 = !DILocation(line: 100, column: 9, scope: !161)
!197 = !DILocation(line: 101, column: 14, scope: !161)
!198 = !DILocation(line: 101, column: 9, scope: !161)
!199 = !DILocation(line: 103, column: 1, scope: !124)
