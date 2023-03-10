; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_loop_11.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_loop_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_loop_11_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !27
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !30
  %tobool = icmp ne i32 %call1, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay2, i64 -8, !dbg !35
  store i32* %add.ptr, i32** %data, align 8, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !43, metadata !DIExpression()), !dbg !44
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !45
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !46
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx5, align 4, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %0, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !58
  %2 = load i32, i32* %arrayidx6, align 4, !dbg !58
  %3 = load i32*, i32** %data, align 8, !dbg !59
  %4 = load i64, i64* %i, align 8, !dbg !60
  %arrayidx7 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !59
  store i32 %2, i32* %arrayidx7, align 4, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %5, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !68
  %arrayidx8 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !68
  store i32 0, i32* %arrayidx8, align 4, !dbg !69
  %7 = load i32*, i32** %data, align 8, !dbg !70
  call void @printWLine(i32* %7), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local i32 @globalReturnsTrue(...) #3

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_loop_11_good() #0 !dbg !73 {
entry:
  call void @goodG2B1(), !dbg !74
  call void @goodG2B2(), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !77 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !83, metadata !DIExpression()), !dbg !84
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !85, metadata !DIExpression()), !dbg !86
  %call = call i64 @time(i64* null) #4, !dbg !87
  %conv = trunc i64 %call to i32, !dbg !88
  call void @srand(i32 %conv) #4, !dbg !89
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !90
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_loop_11_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_loop_11_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !97 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !102
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !103
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !104
  store i32 0, i32* %arrayidx, align 4, !dbg !105
  %call1 = call i32 (...) @globalReturnsFalse(), !dbg !106
  %tobool = icmp ne i32 %call1, 0, !dbg !106
  br i1 %tobool, label %if.then, label %if.else, !dbg !108

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !109
  br label %if.end, !dbg !111

if.else:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !112
  store i32* %arraydecay2, i32** %data, align 8, !dbg !114
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !115, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !118, metadata !DIExpression()), !dbg !119
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !120
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !121
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !122
  store i32 0, i32* %arrayidx5, align 4, !dbg !123
  store i64 0, i64* %i, align 8, !dbg !124
  br label %for.cond, !dbg !126

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !127
  %cmp = icmp ult i64 %0, 100, !dbg !129
  br i1 %cmp, label %for.body, label %for.end, !dbg !130

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !133
  %2 = load i32, i32* %arrayidx6, align 4, !dbg !133
  %3 = load i32*, i32** %data, align 8, !dbg !134
  %4 = load i64, i64* %i, align 8, !dbg !135
  %arrayidx7 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !134
  store i32 %2, i32* %arrayidx7, align 4, !dbg !136
  br label %for.inc, !dbg !137

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !138
  %inc = add i64 %5, 1, !dbg !138
  store i64 %inc, i64* %i, align 8, !dbg !138
  br label %for.cond, !dbg !139, !llvm.loop !140

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !142
  %arrayidx8 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !142
  store i32 0, i32* %arrayidx8, align 4, !dbg !143
  %7 = load i32*, i32** %data, align 8, !dbg !144
  call void @printWLine(i32* %7), !dbg !145
  ret void, !dbg !146
}

declare dso_local i32 @globalReturnsFalse(...) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !147 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !150, metadata !DIExpression()), !dbg !151
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !152
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !153
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !154
  store i32 0, i32* %arrayidx, align 4, !dbg !155
  %call1 = call i32 (...) @globalReturnsTrue(), !dbg !156
  %tobool = icmp ne i32 %call1, 0, !dbg !156
  br i1 %tobool, label %if.then, label %if.end, !dbg !158

if.then:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !159
  store i32* %arraydecay2, i32** %data, align 8, !dbg !161
  br label %if.end, !dbg !162

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !163, metadata !DIExpression()), !dbg !165
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !166, metadata !DIExpression()), !dbg !167
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !168
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !169
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !170
  store i32 0, i32* %arrayidx5, align 4, !dbg !171
  store i64 0, i64* %i, align 8, !dbg !172
  br label %for.cond, !dbg !174

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !175
  %cmp = icmp ult i64 %0, 100, !dbg !177
  br i1 %cmp, label %for.body, label %for.end, !dbg !178

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %1, !dbg !181
  %2 = load i32, i32* %arrayidx6, align 4, !dbg !181
  %3 = load i32*, i32** %data, align 8, !dbg !182
  %4 = load i64, i64* %i, align 8, !dbg !183
  %arrayidx7 = getelementptr inbounds i32, i32* %3, i64 %4, !dbg !182
  store i32 %2, i32* %arrayidx7, align 4, !dbg !184
  br label %for.inc, !dbg !185

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !186
  %inc = add i64 %5, 1, !dbg !186
  store i64 %inc, i64* %i, align 8, !dbg !186
  br label %for.cond, !dbg !187, !llvm.loop !188

for.end:                                          ; preds = %for.cond
  %6 = load i32*, i32** %data, align 8, !dbg !190
  %arrayidx8 = getelementptr inbounds i32, i32* %6, i64 99, !dbg !190
  store i32 0, i32* %arrayidx8, align 4, !dbg !191
  %7 = load i32*, i32** %data, align 8, !dbg !192
  call void @printWLine(i32* %7), !dbg !193
  ret void, !dbg !194
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_loop_11_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 25, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 26, column: 13, scope: !11)
!26 = !DILocation(line: 27, column: 13, scope: !11)
!27 = !DILocation(line: 27, column: 5, scope: !11)
!28 = !DILocation(line: 28, column: 5, scope: !11)
!29 = !DILocation(line: 28, column: 23, scope: !11)
!30 = !DILocation(line: 29, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 8)
!32 = !DILocation(line: 29, column: 8, scope: !11)
!33 = !DILocation(line: 32, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 30, column: 5)
!35 = !DILocation(line: 32, column: 27, scope: !34)
!36 = !DILocation(line: 32, column: 14, scope: !34)
!37 = !DILocation(line: 33, column: 5, scope: !34)
!38 = !DILocalVariable(name: "i", scope: !39, file: !12, line: 35, type: !40)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !41)
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 35, column: 16, scope: !39)
!43 = !DILocalVariable(name: "source", scope: !39, file: !12, line: 36, type: !22)
!44 = !DILocation(line: 36, column: 17, scope: !39)
!45 = !DILocation(line: 37, column: 17, scope: !39)
!46 = !DILocation(line: 37, column: 9, scope: !39)
!47 = !DILocation(line: 38, column: 9, scope: !39)
!48 = !DILocation(line: 38, column: 23, scope: !39)
!49 = !DILocation(line: 40, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !39, file: !12, line: 40, column: 9)
!51 = !DILocation(line: 40, column: 14, scope: !50)
!52 = !DILocation(line: 40, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 40, column: 9)
!54 = !DILocation(line: 40, column: 23, scope: !53)
!55 = !DILocation(line: 40, column: 9, scope: !50)
!56 = !DILocation(line: 42, column: 30, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !12, line: 41, column: 9)
!58 = !DILocation(line: 42, column: 23, scope: !57)
!59 = !DILocation(line: 42, column: 13, scope: !57)
!60 = !DILocation(line: 42, column: 18, scope: !57)
!61 = !DILocation(line: 42, column: 21, scope: !57)
!62 = !DILocation(line: 43, column: 9, scope: !57)
!63 = !DILocation(line: 40, column: 31, scope: !53)
!64 = !DILocation(line: 40, column: 9, scope: !53)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 43, column: 9, scope: !50)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 45, column: 9, scope: !39)
!69 = !DILocation(line: 45, column: 21, scope: !39)
!70 = !DILocation(line: 46, column: 20, scope: !39)
!71 = !DILocation(line: 46, column: 9, scope: !39)
!72 = !DILocation(line: 48, column: 1, scope: !11)
!73 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_loop_11_good", scope: !12, file: !12, line: 115, type: !13, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 117, column: 5, scope: !73)
!75 = !DILocation(line: 118, column: 5, scope: !73)
!76 = !DILocation(line: 119, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 131, type: !78, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!19, !19, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !12, line: 131, type: !19)
!84 = !DILocation(line: 131, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !12, line: 131, type: !80)
!86 = !DILocation(line: 131, column: 27, scope: !77)
!87 = !DILocation(line: 134, column: 22, scope: !77)
!88 = !DILocation(line: 134, column: 12, scope: !77)
!89 = !DILocation(line: 134, column: 5, scope: !77)
!90 = !DILocation(line: 136, column: 5, scope: !77)
!91 = !DILocation(line: 137, column: 5, scope: !77)
!92 = !DILocation(line: 138, column: 5, scope: !77)
!93 = !DILocation(line: 141, column: 5, scope: !77)
!94 = !DILocation(line: 142, column: 5, scope: !77)
!95 = !DILocation(line: 143, column: 5, scope: !77)
!96 = !DILocation(line: 145, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 57, type: !16)
!99 = !DILocation(line: 57, column: 15, scope: !97)
!100 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !12, line: 58, type: !22)
!101 = !DILocation(line: 58, column: 13, scope: !97)
!102 = !DILocation(line: 59, column: 13, scope: !97)
!103 = !DILocation(line: 59, column: 5, scope: !97)
!104 = !DILocation(line: 60, column: 5, scope: !97)
!105 = !DILocation(line: 60, column: 23, scope: !97)
!106 = !DILocation(line: 61, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !97, file: !12, line: 61, column: 8)
!108 = !DILocation(line: 61, column: 8, scope: !97)
!109 = !DILocation(line: 64, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !107, file: !12, line: 62, column: 5)
!111 = !DILocation(line: 65, column: 5, scope: !110)
!112 = !DILocation(line: 69, column: 16, scope: !113)
!113 = distinct !DILexicalBlock(scope: !107, file: !12, line: 67, column: 5)
!114 = !DILocation(line: 69, column: 14, scope: !113)
!115 = !DILocalVariable(name: "i", scope: !116, file: !12, line: 72, type: !40)
!116 = distinct !DILexicalBlock(scope: !97, file: !12, line: 71, column: 5)
!117 = !DILocation(line: 72, column: 16, scope: !116)
!118 = !DILocalVariable(name: "source", scope: !116, file: !12, line: 73, type: !22)
!119 = !DILocation(line: 73, column: 17, scope: !116)
!120 = !DILocation(line: 74, column: 17, scope: !116)
!121 = !DILocation(line: 74, column: 9, scope: !116)
!122 = !DILocation(line: 75, column: 9, scope: !116)
!123 = !DILocation(line: 75, column: 23, scope: !116)
!124 = !DILocation(line: 77, column: 16, scope: !125)
!125 = distinct !DILexicalBlock(scope: !116, file: !12, line: 77, column: 9)
!126 = !DILocation(line: 77, column: 14, scope: !125)
!127 = !DILocation(line: 77, column: 21, scope: !128)
!128 = distinct !DILexicalBlock(scope: !125, file: !12, line: 77, column: 9)
!129 = !DILocation(line: 77, column: 23, scope: !128)
!130 = !DILocation(line: 77, column: 9, scope: !125)
!131 = !DILocation(line: 79, column: 30, scope: !132)
!132 = distinct !DILexicalBlock(scope: !128, file: !12, line: 78, column: 9)
!133 = !DILocation(line: 79, column: 23, scope: !132)
!134 = !DILocation(line: 79, column: 13, scope: !132)
!135 = !DILocation(line: 79, column: 18, scope: !132)
!136 = !DILocation(line: 79, column: 21, scope: !132)
!137 = !DILocation(line: 80, column: 9, scope: !132)
!138 = !DILocation(line: 77, column: 31, scope: !128)
!139 = !DILocation(line: 77, column: 9, scope: !128)
!140 = distinct !{!140, !130, !141, !67}
!141 = !DILocation(line: 80, column: 9, scope: !125)
!142 = !DILocation(line: 82, column: 9, scope: !116)
!143 = !DILocation(line: 82, column: 21, scope: !116)
!144 = !DILocation(line: 83, column: 20, scope: !116)
!145 = !DILocation(line: 83, column: 9, scope: !116)
!146 = !DILocation(line: 85, column: 1, scope: !97)
!147 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!148 = !DILocalVariable(name: "data", scope: !147, file: !12, line: 90, type: !16)
!149 = !DILocation(line: 90, column: 15, scope: !147)
!150 = !DILocalVariable(name: "dataBuffer", scope: !147, file: !12, line: 91, type: !22)
!151 = !DILocation(line: 91, column: 13, scope: !147)
!152 = !DILocation(line: 92, column: 13, scope: !147)
!153 = !DILocation(line: 92, column: 5, scope: !147)
!154 = !DILocation(line: 93, column: 5, scope: !147)
!155 = !DILocation(line: 93, column: 23, scope: !147)
!156 = !DILocation(line: 94, column: 8, scope: !157)
!157 = distinct !DILexicalBlock(scope: !147, file: !12, line: 94, column: 8)
!158 = !DILocation(line: 94, column: 8, scope: !147)
!159 = !DILocation(line: 97, column: 16, scope: !160)
!160 = distinct !DILexicalBlock(scope: !157, file: !12, line: 95, column: 5)
!161 = !DILocation(line: 97, column: 14, scope: !160)
!162 = !DILocation(line: 98, column: 5, scope: !160)
!163 = !DILocalVariable(name: "i", scope: !164, file: !12, line: 100, type: !40)
!164 = distinct !DILexicalBlock(scope: !147, file: !12, line: 99, column: 5)
!165 = !DILocation(line: 100, column: 16, scope: !164)
!166 = !DILocalVariable(name: "source", scope: !164, file: !12, line: 101, type: !22)
!167 = !DILocation(line: 101, column: 17, scope: !164)
!168 = !DILocation(line: 102, column: 17, scope: !164)
!169 = !DILocation(line: 102, column: 9, scope: !164)
!170 = !DILocation(line: 103, column: 9, scope: !164)
!171 = !DILocation(line: 103, column: 23, scope: !164)
!172 = !DILocation(line: 105, column: 16, scope: !173)
!173 = distinct !DILexicalBlock(scope: !164, file: !12, line: 105, column: 9)
!174 = !DILocation(line: 105, column: 14, scope: !173)
!175 = !DILocation(line: 105, column: 21, scope: !176)
!176 = distinct !DILexicalBlock(scope: !173, file: !12, line: 105, column: 9)
!177 = !DILocation(line: 105, column: 23, scope: !176)
!178 = !DILocation(line: 105, column: 9, scope: !173)
!179 = !DILocation(line: 107, column: 30, scope: !180)
!180 = distinct !DILexicalBlock(scope: !176, file: !12, line: 106, column: 9)
!181 = !DILocation(line: 107, column: 23, scope: !180)
!182 = !DILocation(line: 107, column: 13, scope: !180)
!183 = !DILocation(line: 107, column: 18, scope: !180)
!184 = !DILocation(line: 107, column: 21, scope: !180)
!185 = !DILocation(line: 108, column: 9, scope: !180)
!186 = !DILocation(line: 105, column: 31, scope: !176)
!187 = !DILocation(line: 105, column: 9, scope: !176)
!188 = distinct !{!188, !178, !189, !67}
!189 = !DILocation(line: 108, column: 9, scope: !173)
!190 = !DILocation(line: 110, column: 9, scope: !164)
!191 = !DILocation(line: 110, column: 21, scope: !164)
!192 = !DILocation(line: 111, column: 20, scope: !164)
!193 = !DILocation(line: 111, column: 9, scope: !164)
!194 = !DILocation(line: 113, column: 1, scope: !147)
