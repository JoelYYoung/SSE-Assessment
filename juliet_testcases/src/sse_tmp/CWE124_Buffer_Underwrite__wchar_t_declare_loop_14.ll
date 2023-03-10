; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_loop_14.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_loop_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_loop_14_bad() #0 !dbg !11 {
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
  %0 = load i32, i32* @globalFive, align 4, !dbg !30
  %cmp = icmp eq i32 %0, 5, !dbg !32
  br i1 %cmp, label %if.then, label %if.end, !dbg !33

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !34
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay1, i64 -8, !dbg !36
  store i32* %add.ptr, i32** %data, align 8, !dbg !37
  br label %if.end, !dbg !38

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !39, metadata !DIExpression()), !dbg !43
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !44, metadata !DIExpression()), !dbg !45
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !46
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !47
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !48
  store i32 0, i32* %arrayidx4, align 4, !dbg !49
  store i64 0, i64* %i, align 8, !dbg !50
  br label %for.cond, !dbg !52

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !53
  %cmp5 = icmp ult i64 %1, 100, !dbg !55
  br i1 %cmp5, label %for.body, label %for.end, !dbg !56

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !59
  %3 = load i32, i32* %arrayidx6, align 4, !dbg !59
  %4 = load i32*, i32** %data, align 8, !dbg !60
  %5 = load i64, i64* %i, align 8, !dbg !61
  %arrayidx7 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !60
  store i32 %3, i32* %arrayidx7, align 4, !dbg !62
  br label %for.inc, !dbg !63

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !64
  %inc = add i64 %6, 1, !dbg !64
  store i64 %inc, i64* %i, align 8, !dbg !64
  br label %for.cond, !dbg !65, !llvm.loop !66

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !69
  %arrayidx8 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !69
  store i32 0, i32* %arrayidx8, align 4, !dbg !70
  %8 = load i32*, i32** %data, align 8, !dbg !71
  call void @printWLine(i32* %8), !dbg !72
  ret void, !dbg !73
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__wchar_t_declare_loop_14_good() #0 !dbg !74 {
entry:
  call void @goodG2B1(), !dbg !75
  call void @goodG2B2(), !dbg !76
  ret void, !dbg !77
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !78 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !84, metadata !DIExpression()), !dbg !85
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !86, metadata !DIExpression()), !dbg !87
  %call = call i64 @time(i64* null) #4, !dbg !88
  %conv = trunc i64 %call to i32, !dbg !89
  call void @srand(i32 %conv) #4, !dbg !90
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !91
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_loop_14_good(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !93
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !94
  call void @CWE124_Buffer_Underwrite__wchar_t_declare_loop_14_bad(), !dbg !95
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !96
  ret i32 0, !dbg !97
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !98 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !99, metadata !DIExpression()), !dbg !100
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !101, metadata !DIExpression()), !dbg !102
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !103
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !104
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  %0 = load i32, i32* @globalFive, align 4, !dbg !107
  %cmp = icmp ne i32 %0, 5, !dbg !109
  br i1 %cmp, label %if.then, label %if.else, !dbg !110

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !111
  br label %if.end, !dbg !113

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !114
  store i32* %arraydecay1, i32** %data, align 8, !dbg !116
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !117, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !120, metadata !DIExpression()), !dbg !121
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !122
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !123
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !124
  store i32 0, i32* %arrayidx4, align 4, !dbg !125
  store i64 0, i64* %i, align 8, !dbg !126
  br label %for.cond, !dbg !128

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !129
  %cmp5 = icmp ult i64 %1, 100, !dbg !131
  br i1 %cmp5, label %for.body, label %for.end, !dbg !132

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !135
  %3 = load i32, i32* %arrayidx6, align 4, !dbg !135
  %4 = load i32*, i32** %data, align 8, !dbg !136
  %5 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx7 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !136
  store i32 %3, i32* %arrayidx7, align 4, !dbg !138
  br label %for.inc, !dbg !139

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !140
  %inc = add i64 %6, 1, !dbg !140
  store i64 %inc, i64* %i, align 8, !dbg !140
  br label %for.cond, !dbg !141, !llvm.loop !142

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !144
  %arrayidx8 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !144
  store i32 0, i32* %arrayidx8, align 4, !dbg !145
  %8 = load i32*, i32** %data, align 8, !dbg !146
  call void @printWLine(i32* %8), !dbg !147
  ret void, !dbg !148
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !149 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !150, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !152, metadata !DIExpression()), !dbg !153
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !154
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !155
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !156
  store i32 0, i32* %arrayidx, align 4, !dbg !157
  %0 = load i32, i32* @globalFive, align 4, !dbg !158
  %cmp = icmp eq i32 %0, 5, !dbg !160
  br i1 %cmp, label %if.then, label %if.end, !dbg !161

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !162
  store i32* %arraydecay1, i32** %data, align 8, !dbg !164
  br label %if.end, !dbg !165

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !166, metadata !DIExpression()), !dbg !168
  call void @llvm.dbg.declare(metadata [100 x i32]* %source, metadata !169, metadata !DIExpression()), !dbg !170
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 0, !dbg !171
  %call3 = call i32* @wmemset(i32* %arraydecay2, i32 67, i64 99) #4, !dbg !172
  %arrayidx4 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 99, !dbg !173
  store i32 0, i32* %arrayidx4, align 4, !dbg !174
  store i64 0, i64* %i, align 8, !dbg !175
  br label %for.cond, !dbg !177

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !178
  %cmp5 = icmp ult i64 %1, 100, !dbg !180
  br i1 %cmp5, label %for.body, label %for.end, !dbg !181

for.body:                                         ; preds = %for.cond
  %2 = load i64, i64* %i, align 8, !dbg !182
  %arrayidx6 = getelementptr inbounds [100 x i32], [100 x i32]* %source, i64 0, i64 %2, !dbg !184
  %3 = load i32, i32* %arrayidx6, align 4, !dbg !184
  %4 = load i32*, i32** %data, align 8, !dbg !185
  %5 = load i64, i64* %i, align 8, !dbg !186
  %arrayidx7 = getelementptr inbounds i32, i32* %4, i64 %5, !dbg !185
  store i32 %3, i32* %arrayidx7, align 4, !dbg !187
  br label %for.inc, !dbg !188

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !189
  %inc = add i64 %6, 1, !dbg !189
  store i64 %inc, i64* %i, align 8, !dbg !189
  br label %for.cond, !dbg !190, !llvm.loop !191

for.end:                                          ; preds = %for.cond
  %7 = load i32*, i32** %data, align 8, !dbg !193
  %arrayidx8 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !193
  store i32 0, i32* %arrayidx8, align 4, !dbg !194
  %8 = load i32*, i32** %data, align 8, !dbg !195
  call void @printWLine(i32* %8), !dbg !196
  ret void, !dbg !197
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_loop_14_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__wchar_t_declare_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!32 = !DILocation(line: 29, column: 18, scope: !31)
!33 = !DILocation(line: 29, column: 8, scope: !11)
!34 = !DILocation(line: 32, column: 16, scope: !35)
!35 = distinct !DILexicalBlock(scope: !31, file: !12, line: 30, column: 5)
!36 = !DILocation(line: 32, column: 27, scope: !35)
!37 = !DILocation(line: 32, column: 14, scope: !35)
!38 = !DILocation(line: 33, column: 5, scope: !35)
!39 = !DILocalVariable(name: "i", scope: !40, file: !12, line: 35, type: !41)
!40 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!41 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !42)
!42 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!43 = !DILocation(line: 35, column: 16, scope: !40)
!44 = !DILocalVariable(name: "source", scope: !40, file: !12, line: 36, type: !22)
!45 = !DILocation(line: 36, column: 17, scope: !40)
!46 = !DILocation(line: 37, column: 17, scope: !40)
!47 = !DILocation(line: 37, column: 9, scope: !40)
!48 = !DILocation(line: 38, column: 9, scope: !40)
!49 = !DILocation(line: 38, column: 23, scope: !40)
!50 = !DILocation(line: 40, column: 16, scope: !51)
!51 = distinct !DILexicalBlock(scope: !40, file: !12, line: 40, column: 9)
!52 = !DILocation(line: 40, column: 14, scope: !51)
!53 = !DILocation(line: 40, column: 21, scope: !54)
!54 = distinct !DILexicalBlock(scope: !51, file: !12, line: 40, column: 9)
!55 = !DILocation(line: 40, column: 23, scope: !54)
!56 = !DILocation(line: 40, column: 9, scope: !51)
!57 = !DILocation(line: 42, column: 30, scope: !58)
!58 = distinct !DILexicalBlock(scope: !54, file: !12, line: 41, column: 9)
!59 = !DILocation(line: 42, column: 23, scope: !58)
!60 = !DILocation(line: 42, column: 13, scope: !58)
!61 = !DILocation(line: 42, column: 18, scope: !58)
!62 = !DILocation(line: 42, column: 21, scope: !58)
!63 = !DILocation(line: 43, column: 9, scope: !58)
!64 = !DILocation(line: 40, column: 31, scope: !54)
!65 = !DILocation(line: 40, column: 9, scope: !54)
!66 = distinct !{!66, !56, !67, !68}
!67 = !DILocation(line: 43, column: 9, scope: !51)
!68 = !{!"llvm.loop.mustprogress"}
!69 = !DILocation(line: 45, column: 9, scope: !40)
!70 = !DILocation(line: 45, column: 21, scope: !40)
!71 = !DILocation(line: 46, column: 20, scope: !40)
!72 = !DILocation(line: 46, column: 9, scope: !40)
!73 = !DILocation(line: 48, column: 1, scope: !11)
!74 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__wchar_t_declare_loop_14_good", scope: !12, file: !12, line: 115, type: !13, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DILocation(line: 117, column: 5, scope: !74)
!76 = !DILocation(line: 118, column: 5, scope: !74)
!77 = !DILocation(line: 119, column: 1, scope: !74)
!78 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 131, type: !79, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!79 = !DISubroutineType(types: !80)
!80 = !{!19, !19, !81}
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !83, size: 64)
!83 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!84 = !DILocalVariable(name: "argc", arg: 1, scope: !78, file: !12, line: 131, type: !19)
!85 = !DILocation(line: 131, column: 14, scope: !78)
!86 = !DILocalVariable(name: "argv", arg: 2, scope: !78, file: !12, line: 131, type: !81)
!87 = !DILocation(line: 131, column: 27, scope: !78)
!88 = !DILocation(line: 134, column: 22, scope: !78)
!89 = !DILocation(line: 134, column: 12, scope: !78)
!90 = !DILocation(line: 134, column: 5, scope: !78)
!91 = !DILocation(line: 136, column: 5, scope: !78)
!92 = !DILocation(line: 137, column: 5, scope: !78)
!93 = !DILocation(line: 138, column: 5, scope: !78)
!94 = !DILocation(line: 141, column: 5, scope: !78)
!95 = !DILocation(line: 142, column: 5, scope: !78)
!96 = !DILocation(line: 143, column: 5, scope: !78)
!97 = !DILocation(line: 145, column: 5, scope: !78)
!98 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!99 = !DILocalVariable(name: "data", scope: !98, file: !12, line: 57, type: !16)
!100 = !DILocation(line: 57, column: 15, scope: !98)
!101 = !DILocalVariable(name: "dataBuffer", scope: !98, file: !12, line: 58, type: !22)
!102 = !DILocation(line: 58, column: 13, scope: !98)
!103 = !DILocation(line: 59, column: 13, scope: !98)
!104 = !DILocation(line: 59, column: 5, scope: !98)
!105 = !DILocation(line: 60, column: 5, scope: !98)
!106 = !DILocation(line: 60, column: 23, scope: !98)
!107 = !DILocation(line: 61, column: 8, scope: !108)
!108 = distinct !DILexicalBlock(scope: !98, file: !12, line: 61, column: 8)
!109 = !DILocation(line: 61, column: 18, scope: !108)
!110 = !DILocation(line: 61, column: 8, scope: !98)
!111 = !DILocation(line: 64, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !108, file: !12, line: 62, column: 5)
!113 = !DILocation(line: 65, column: 5, scope: !112)
!114 = !DILocation(line: 69, column: 16, scope: !115)
!115 = distinct !DILexicalBlock(scope: !108, file: !12, line: 67, column: 5)
!116 = !DILocation(line: 69, column: 14, scope: !115)
!117 = !DILocalVariable(name: "i", scope: !118, file: !12, line: 72, type: !41)
!118 = distinct !DILexicalBlock(scope: !98, file: !12, line: 71, column: 5)
!119 = !DILocation(line: 72, column: 16, scope: !118)
!120 = !DILocalVariable(name: "source", scope: !118, file: !12, line: 73, type: !22)
!121 = !DILocation(line: 73, column: 17, scope: !118)
!122 = !DILocation(line: 74, column: 17, scope: !118)
!123 = !DILocation(line: 74, column: 9, scope: !118)
!124 = !DILocation(line: 75, column: 9, scope: !118)
!125 = !DILocation(line: 75, column: 23, scope: !118)
!126 = !DILocation(line: 77, column: 16, scope: !127)
!127 = distinct !DILexicalBlock(scope: !118, file: !12, line: 77, column: 9)
!128 = !DILocation(line: 77, column: 14, scope: !127)
!129 = !DILocation(line: 77, column: 21, scope: !130)
!130 = distinct !DILexicalBlock(scope: !127, file: !12, line: 77, column: 9)
!131 = !DILocation(line: 77, column: 23, scope: !130)
!132 = !DILocation(line: 77, column: 9, scope: !127)
!133 = !DILocation(line: 79, column: 30, scope: !134)
!134 = distinct !DILexicalBlock(scope: !130, file: !12, line: 78, column: 9)
!135 = !DILocation(line: 79, column: 23, scope: !134)
!136 = !DILocation(line: 79, column: 13, scope: !134)
!137 = !DILocation(line: 79, column: 18, scope: !134)
!138 = !DILocation(line: 79, column: 21, scope: !134)
!139 = !DILocation(line: 80, column: 9, scope: !134)
!140 = !DILocation(line: 77, column: 31, scope: !130)
!141 = !DILocation(line: 77, column: 9, scope: !130)
!142 = distinct !{!142, !132, !143, !68}
!143 = !DILocation(line: 80, column: 9, scope: !127)
!144 = !DILocation(line: 82, column: 9, scope: !118)
!145 = !DILocation(line: 82, column: 21, scope: !118)
!146 = !DILocation(line: 83, column: 20, scope: !118)
!147 = !DILocation(line: 83, column: 9, scope: !118)
!148 = !DILocation(line: 85, column: 1, scope: !98)
!149 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!150 = !DILocalVariable(name: "data", scope: !149, file: !12, line: 90, type: !16)
!151 = !DILocation(line: 90, column: 15, scope: !149)
!152 = !DILocalVariable(name: "dataBuffer", scope: !149, file: !12, line: 91, type: !22)
!153 = !DILocation(line: 91, column: 13, scope: !149)
!154 = !DILocation(line: 92, column: 13, scope: !149)
!155 = !DILocation(line: 92, column: 5, scope: !149)
!156 = !DILocation(line: 93, column: 5, scope: !149)
!157 = !DILocation(line: 93, column: 23, scope: !149)
!158 = !DILocation(line: 94, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !149, file: !12, line: 94, column: 8)
!160 = !DILocation(line: 94, column: 18, scope: !159)
!161 = !DILocation(line: 94, column: 8, scope: !149)
!162 = !DILocation(line: 97, column: 16, scope: !163)
!163 = distinct !DILexicalBlock(scope: !159, file: !12, line: 95, column: 5)
!164 = !DILocation(line: 97, column: 14, scope: !163)
!165 = !DILocation(line: 98, column: 5, scope: !163)
!166 = !DILocalVariable(name: "i", scope: !167, file: !12, line: 100, type: !41)
!167 = distinct !DILexicalBlock(scope: !149, file: !12, line: 99, column: 5)
!168 = !DILocation(line: 100, column: 16, scope: !167)
!169 = !DILocalVariable(name: "source", scope: !167, file: !12, line: 101, type: !22)
!170 = !DILocation(line: 101, column: 17, scope: !167)
!171 = !DILocation(line: 102, column: 17, scope: !167)
!172 = !DILocation(line: 102, column: 9, scope: !167)
!173 = !DILocation(line: 103, column: 9, scope: !167)
!174 = !DILocation(line: 103, column: 23, scope: !167)
!175 = !DILocation(line: 105, column: 16, scope: !176)
!176 = distinct !DILexicalBlock(scope: !167, file: !12, line: 105, column: 9)
!177 = !DILocation(line: 105, column: 14, scope: !176)
!178 = !DILocation(line: 105, column: 21, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !12, line: 105, column: 9)
!180 = !DILocation(line: 105, column: 23, scope: !179)
!181 = !DILocation(line: 105, column: 9, scope: !176)
!182 = !DILocation(line: 107, column: 30, scope: !183)
!183 = distinct !DILexicalBlock(scope: !179, file: !12, line: 106, column: 9)
!184 = !DILocation(line: 107, column: 23, scope: !183)
!185 = !DILocation(line: 107, column: 13, scope: !183)
!186 = !DILocation(line: 107, column: 18, scope: !183)
!187 = !DILocation(line: 107, column: 21, scope: !183)
!188 = !DILocation(line: 108, column: 9, scope: !183)
!189 = !DILocation(line: 105, column: 31, scope: !179)
!190 = !DILocation(line: 105, column: 9, scope: !179)
!191 = distinct !{!191, !181, !192, !68}
!192 = !DILocation(line: 108, column: 9, scope: !176)
!193 = !DILocation(line: 110, column: 9, scope: !167)
!194 = !DILocation(line: 110, column: 21, scope: !167)
!195 = !DILocation(line: 111, column: 20, scope: !167)
!196 = !DILocation(line: 111, column: 9, scope: !167)
!197 = !DILocation(line: 113, column: 1, scope: !149)
