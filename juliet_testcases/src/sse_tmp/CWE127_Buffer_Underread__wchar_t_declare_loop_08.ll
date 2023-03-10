; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_08.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !15, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !21, metadata !DIExpression()), !dbg !25
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !26
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !27
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !28
  store i32 0, i32* %arrayidx, align 4, !dbg !29
  %call1 = call i32 @staticReturnsTrue(), !dbg !30
  %tobool = icmp ne i32 %call1, 0, !dbg !30
  br i1 %tobool, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !33
  %add.ptr = getelementptr inbounds i32, i32* %arraydecay2, i64 -8, !dbg !35
  store i32* %add.ptr, i32** %data, align 8, !dbg !36
  br label %if.end, !dbg !37

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !38, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !43, metadata !DIExpression()), !dbg !44
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !45
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !46
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !47
  store i32 0, i32* %arrayidx5, align 4, !dbg !48
  store i64 0, i64* %i, align 8, !dbg !49
  br label %for.cond, !dbg !51

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !52
  %cmp = icmp ult i64 %0, 100, !dbg !54
  br i1 %cmp, label %for.body, label %for.end, !dbg !55

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %data, align 8, !dbg !56
  %2 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx6 = getelementptr inbounds i32, i32* %1, i64 %2, !dbg !56
  %3 = load i32, i32* %arrayidx6, align 4, !dbg !56
  %4 = load i64, i64* %i, align 8, !dbg !59
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %4, !dbg !60
  store i32 %3, i32* %arrayidx7, align 4, !dbg !61
  br label %for.inc, !dbg !62

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !63
  %inc = add i64 %5, 1, !dbg !63
  store i64 %inc, i64* %i, align 8, !dbg !63
  br label %for.cond, !dbg !64, !llvm.loop !65

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !68
  store i32 0, i32* %arrayidx8, align 4, !dbg !69
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !70
  call void @printWLine(i32* %arraydecay9), !dbg !71
  ret void, !dbg !72
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

declare dso_local void @printWLine(i32*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__wchar_t_declare_loop_08_good() #0 !dbg !73 {
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
  call void @CWE127_Buffer_Underread__wchar_t_declare_loop_08_good(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !93
  call void @CWE127_Buffer_Underread__wchar_t_declare_loop_08_bad(), !dbg !94
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !95
  ret i32 0, !dbg !96
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !97 {
entry:
  ret i32 1, !dbg !100
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !101 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !102, metadata !DIExpression()), !dbg !103
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !104, metadata !DIExpression()), !dbg !105
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !106
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !107
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !108
  store i32 0, i32* %arrayidx, align 4, !dbg !109
  %call1 = call i32 @staticReturnsFalse(), !dbg !110
  %tobool = icmp ne i32 %call1, 0, !dbg !110
  br i1 %tobool, label %if.then, label %if.else, !dbg !112

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !113
  br label %if.end, !dbg !115

if.else:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !116
  store i32* %arraydecay2, i32** %data, align 8, !dbg !118
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !119, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !122, metadata !DIExpression()), !dbg !123
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !124
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !125
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !126
  store i32 0, i32* %arrayidx5, align 4, !dbg !127
  store i64 0, i64* %i, align 8, !dbg !128
  br label %for.cond, !dbg !130

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !131
  %cmp = icmp ult i64 %0, 100, !dbg !133
  br i1 %cmp, label %for.body, label %for.end, !dbg !134

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %data, align 8, !dbg !135
  %2 = load i64, i64* %i, align 8, !dbg !137
  %arrayidx6 = getelementptr inbounds i32, i32* %1, i64 %2, !dbg !135
  %3 = load i32, i32* %arrayidx6, align 4, !dbg !135
  %4 = load i64, i64* %i, align 8, !dbg !138
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %4, !dbg !139
  store i32 %3, i32* %arrayidx7, align 4, !dbg !140
  br label %for.inc, !dbg !141

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !142
  %inc = add i64 %5, 1, !dbg !142
  store i64 %inc, i64* %i, align 8, !dbg !142
  br label %for.cond, !dbg !143, !llvm.loop !144

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !146
  store i32 0, i32* %arrayidx8, align 4, !dbg !147
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !148
  call void @printWLine(i32* %arraydecay9), !dbg !149
  ret void, !dbg !150
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !151 {
entry:
  ret i32 0, !dbg !152
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !153 {
entry:
  %data = alloca i32*, align 8
  %dataBuffer = alloca [100 x i32], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !154, metadata !DIExpression()), !dbg !155
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataBuffer, metadata !156, metadata !DIExpression()), !dbg !157
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !158
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 99) #4, !dbg !159
  %arrayidx = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 99, !dbg !160
  store i32 0, i32* %arrayidx, align 4, !dbg !161
  %call1 = call i32 @staticReturnsTrue(), !dbg !162
  %tobool = icmp ne i32 %call1, 0, !dbg !162
  br i1 %tobool, label %if.then, label %if.end, !dbg !164

if.then:                                          ; preds = %entry
  %arraydecay2 = getelementptr inbounds [100 x i32], [100 x i32]* %dataBuffer, i64 0, i64 0, !dbg !165
  store i32* %arraydecay2, i32** %data, align 8, !dbg !167
  br label %if.end, !dbg !168

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !169, metadata !DIExpression()), !dbg !171
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !172, metadata !DIExpression()), !dbg !173
  %arraydecay3 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !174
  %call4 = call i32* @wmemset(i32* %arraydecay3, i32 67, i64 99) #4, !dbg !175
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !176
  store i32 0, i32* %arrayidx5, align 4, !dbg !177
  store i64 0, i64* %i, align 8, !dbg !178
  br label %for.cond, !dbg !180

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !181
  %cmp = icmp ult i64 %0, 100, !dbg !183
  br i1 %cmp, label %for.body, label %for.end, !dbg !184

for.body:                                         ; preds = %for.cond
  %1 = load i32*, i32** %data, align 8, !dbg !185
  %2 = load i64, i64* %i, align 8, !dbg !187
  %arrayidx6 = getelementptr inbounds i32, i32* %1, i64 %2, !dbg !185
  %3 = load i32, i32* %arrayidx6, align 4, !dbg !185
  %4 = load i64, i64* %i, align 8, !dbg !188
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 %4, !dbg !189
  store i32 %3, i32* %arrayidx7, align 4, !dbg !190
  br label %for.inc, !dbg !191

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !192
  %inc = add i64 %5, 1, !dbg !192
  store i64 %inc, i64* %i, align 8, !dbg !192
  br label %for.cond, !dbg !193, !llvm.loop !194

for.end:                                          ; preds = %for.cond
  %arrayidx8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !196
  store i32 0, i32* %arrayidx8, align 4, !dbg !197
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !198
  call void @printWLine(i32* %arraydecay9), !dbg !199
  ret void, !dbg !200
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__wchar_t_declare_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !18, line: 74, baseType: !19)
!18 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!19 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!20 = !DILocation(line: 39, column: 15, scope: !11)
!21 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 40, type: !22)
!22 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 3200, elements: !23)
!23 = !{!24}
!24 = !DISubrange(count: 100)
!25 = !DILocation(line: 40, column: 13, scope: !11)
!26 = !DILocation(line: 41, column: 13, scope: !11)
!27 = !DILocation(line: 41, column: 5, scope: !11)
!28 = !DILocation(line: 42, column: 5, scope: !11)
!29 = !DILocation(line: 42, column: 23, scope: !11)
!30 = !DILocation(line: 43, column: 8, scope: !31)
!31 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 8)
!32 = !DILocation(line: 43, column: 8, scope: !11)
!33 = !DILocation(line: 46, column: 16, scope: !34)
!34 = distinct !DILexicalBlock(scope: !31, file: !12, line: 44, column: 5)
!35 = !DILocation(line: 46, column: 27, scope: !34)
!36 = !DILocation(line: 46, column: 14, scope: !34)
!37 = !DILocation(line: 47, column: 5, scope: !34)
!38 = !DILocalVariable(name: "i", scope: !39, file: !12, line: 49, type: !40)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 48, column: 5)
!40 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !18, line: 46, baseType: !41)
!41 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!42 = !DILocation(line: 49, column: 16, scope: !39)
!43 = !DILocalVariable(name: "dest", scope: !39, file: !12, line: 50, type: !22)
!44 = !DILocation(line: 50, column: 17, scope: !39)
!45 = !DILocation(line: 51, column: 17, scope: !39)
!46 = !DILocation(line: 51, column: 9, scope: !39)
!47 = !DILocation(line: 52, column: 9, scope: !39)
!48 = !DILocation(line: 52, column: 21, scope: !39)
!49 = !DILocation(line: 54, column: 16, scope: !50)
!50 = distinct !DILexicalBlock(scope: !39, file: !12, line: 54, column: 9)
!51 = !DILocation(line: 54, column: 14, scope: !50)
!52 = !DILocation(line: 54, column: 21, scope: !53)
!53 = distinct !DILexicalBlock(scope: !50, file: !12, line: 54, column: 9)
!54 = !DILocation(line: 54, column: 23, scope: !53)
!55 = !DILocation(line: 54, column: 9, scope: !50)
!56 = !DILocation(line: 56, column: 23, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !12, line: 55, column: 9)
!58 = !DILocation(line: 56, column: 28, scope: !57)
!59 = !DILocation(line: 56, column: 18, scope: !57)
!60 = !DILocation(line: 56, column: 13, scope: !57)
!61 = !DILocation(line: 56, column: 21, scope: !57)
!62 = !DILocation(line: 57, column: 9, scope: !57)
!63 = !DILocation(line: 54, column: 31, scope: !53)
!64 = !DILocation(line: 54, column: 9, scope: !53)
!65 = distinct !{!65, !55, !66, !67}
!66 = !DILocation(line: 57, column: 9, scope: !50)
!67 = !{!"llvm.loop.mustprogress"}
!68 = !DILocation(line: 59, column: 9, scope: !39)
!69 = !DILocation(line: 59, column: 21, scope: !39)
!70 = !DILocation(line: 60, column: 20, scope: !39)
!71 = !DILocation(line: 60, column: 9, scope: !39)
!72 = !DILocation(line: 62, column: 1, scope: !11)
!73 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__wchar_t_declare_loop_08_good", scope: !12, file: !12, line: 129, type: !13, scopeLine: 130, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!74 = !DILocation(line: 131, column: 5, scope: !73)
!75 = !DILocation(line: 132, column: 5, scope: !73)
!76 = !DILocation(line: 133, column: 1, scope: !73)
!77 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 145, type: !78, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{!19, !19, !80}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !82, size: 64)
!82 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!83 = !DILocalVariable(name: "argc", arg: 1, scope: !77, file: !12, line: 145, type: !19)
!84 = !DILocation(line: 145, column: 14, scope: !77)
!85 = !DILocalVariable(name: "argv", arg: 2, scope: !77, file: !12, line: 145, type: !80)
!86 = !DILocation(line: 145, column: 27, scope: !77)
!87 = !DILocation(line: 148, column: 22, scope: !77)
!88 = !DILocation(line: 148, column: 12, scope: !77)
!89 = !DILocation(line: 148, column: 5, scope: !77)
!90 = !DILocation(line: 150, column: 5, scope: !77)
!91 = !DILocation(line: 151, column: 5, scope: !77)
!92 = !DILocation(line: 152, column: 5, scope: !77)
!93 = !DILocation(line: 155, column: 5, scope: !77)
!94 = !DILocation(line: 156, column: 5, scope: !77)
!95 = !DILocation(line: 157, column: 5, scope: !77)
!96 = !DILocation(line: 159, column: 5, scope: !77)
!97 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !98, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DISubroutineType(types: !99)
!99 = !{!19}
!100 = !DILocation(line: 27, column: 5, scope: !97)
!101 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!102 = !DILocalVariable(name: "data", scope: !101, file: !12, line: 71, type: !16)
!103 = !DILocation(line: 71, column: 15, scope: !101)
!104 = !DILocalVariable(name: "dataBuffer", scope: !101, file: !12, line: 72, type: !22)
!105 = !DILocation(line: 72, column: 13, scope: !101)
!106 = !DILocation(line: 73, column: 13, scope: !101)
!107 = !DILocation(line: 73, column: 5, scope: !101)
!108 = !DILocation(line: 74, column: 5, scope: !101)
!109 = !DILocation(line: 74, column: 23, scope: !101)
!110 = !DILocation(line: 75, column: 8, scope: !111)
!111 = distinct !DILexicalBlock(scope: !101, file: !12, line: 75, column: 8)
!112 = !DILocation(line: 75, column: 8, scope: !101)
!113 = !DILocation(line: 78, column: 9, scope: !114)
!114 = distinct !DILexicalBlock(scope: !111, file: !12, line: 76, column: 5)
!115 = !DILocation(line: 79, column: 5, scope: !114)
!116 = !DILocation(line: 83, column: 16, scope: !117)
!117 = distinct !DILexicalBlock(scope: !111, file: !12, line: 81, column: 5)
!118 = !DILocation(line: 83, column: 14, scope: !117)
!119 = !DILocalVariable(name: "i", scope: !120, file: !12, line: 86, type: !40)
!120 = distinct !DILexicalBlock(scope: !101, file: !12, line: 85, column: 5)
!121 = !DILocation(line: 86, column: 16, scope: !120)
!122 = !DILocalVariable(name: "dest", scope: !120, file: !12, line: 87, type: !22)
!123 = !DILocation(line: 87, column: 17, scope: !120)
!124 = !DILocation(line: 88, column: 17, scope: !120)
!125 = !DILocation(line: 88, column: 9, scope: !120)
!126 = !DILocation(line: 89, column: 9, scope: !120)
!127 = !DILocation(line: 89, column: 21, scope: !120)
!128 = !DILocation(line: 91, column: 16, scope: !129)
!129 = distinct !DILexicalBlock(scope: !120, file: !12, line: 91, column: 9)
!130 = !DILocation(line: 91, column: 14, scope: !129)
!131 = !DILocation(line: 91, column: 21, scope: !132)
!132 = distinct !DILexicalBlock(scope: !129, file: !12, line: 91, column: 9)
!133 = !DILocation(line: 91, column: 23, scope: !132)
!134 = !DILocation(line: 91, column: 9, scope: !129)
!135 = !DILocation(line: 93, column: 23, scope: !136)
!136 = distinct !DILexicalBlock(scope: !132, file: !12, line: 92, column: 9)
!137 = !DILocation(line: 93, column: 28, scope: !136)
!138 = !DILocation(line: 93, column: 18, scope: !136)
!139 = !DILocation(line: 93, column: 13, scope: !136)
!140 = !DILocation(line: 93, column: 21, scope: !136)
!141 = !DILocation(line: 94, column: 9, scope: !136)
!142 = !DILocation(line: 91, column: 31, scope: !132)
!143 = !DILocation(line: 91, column: 9, scope: !132)
!144 = distinct !{!144, !134, !145, !67}
!145 = !DILocation(line: 94, column: 9, scope: !129)
!146 = !DILocation(line: 96, column: 9, scope: !120)
!147 = !DILocation(line: 96, column: 21, scope: !120)
!148 = !DILocation(line: 97, column: 20, scope: !120)
!149 = !DILocation(line: 97, column: 9, scope: !120)
!150 = !DILocation(line: 99, column: 1, scope: !101)
!151 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !98, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!152 = !DILocation(line: 32, column: 5, scope: !151)
!153 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 102, type: !13, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!154 = !DILocalVariable(name: "data", scope: !153, file: !12, line: 104, type: !16)
!155 = !DILocation(line: 104, column: 15, scope: !153)
!156 = !DILocalVariable(name: "dataBuffer", scope: !153, file: !12, line: 105, type: !22)
!157 = !DILocation(line: 105, column: 13, scope: !153)
!158 = !DILocation(line: 106, column: 13, scope: !153)
!159 = !DILocation(line: 106, column: 5, scope: !153)
!160 = !DILocation(line: 107, column: 5, scope: !153)
!161 = !DILocation(line: 107, column: 23, scope: !153)
!162 = !DILocation(line: 108, column: 8, scope: !163)
!163 = distinct !DILexicalBlock(scope: !153, file: !12, line: 108, column: 8)
!164 = !DILocation(line: 108, column: 8, scope: !153)
!165 = !DILocation(line: 111, column: 16, scope: !166)
!166 = distinct !DILexicalBlock(scope: !163, file: !12, line: 109, column: 5)
!167 = !DILocation(line: 111, column: 14, scope: !166)
!168 = !DILocation(line: 112, column: 5, scope: !166)
!169 = !DILocalVariable(name: "i", scope: !170, file: !12, line: 114, type: !40)
!170 = distinct !DILexicalBlock(scope: !153, file: !12, line: 113, column: 5)
!171 = !DILocation(line: 114, column: 16, scope: !170)
!172 = !DILocalVariable(name: "dest", scope: !170, file: !12, line: 115, type: !22)
!173 = !DILocation(line: 115, column: 17, scope: !170)
!174 = !DILocation(line: 116, column: 17, scope: !170)
!175 = !DILocation(line: 116, column: 9, scope: !170)
!176 = !DILocation(line: 117, column: 9, scope: !170)
!177 = !DILocation(line: 117, column: 21, scope: !170)
!178 = !DILocation(line: 119, column: 16, scope: !179)
!179 = distinct !DILexicalBlock(scope: !170, file: !12, line: 119, column: 9)
!180 = !DILocation(line: 119, column: 14, scope: !179)
!181 = !DILocation(line: 119, column: 21, scope: !182)
!182 = distinct !DILexicalBlock(scope: !179, file: !12, line: 119, column: 9)
!183 = !DILocation(line: 119, column: 23, scope: !182)
!184 = !DILocation(line: 119, column: 9, scope: !179)
!185 = !DILocation(line: 121, column: 23, scope: !186)
!186 = distinct !DILexicalBlock(scope: !182, file: !12, line: 120, column: 9)
!187 = !DILocation(line: 121, column: 28, scope: !186)
!188 = !DILocation(line: 121, column: 18, scope: !186)
!189 = !DILocation(line: 121, column: 13, scope: !186)
!190 = !DILocation(line: 121, column: 21, scope: !186)
!191 = !DILocation(line: 122, column: 9, scope: !186)
!192 = !DILocation(line: 119, column: 31, scope: !182)
!193 = !DILocation(line: 119, column: 9, scope: !182)
!194 = distinct !{!194, !184, !195, !67}
!195 = !DILocation(line: 122, column: 9, scope: !179)
!196 = !DILocation(line: 124, column: 9, scope: !170)
!197 = !DILocation(line: 124, column: 21, scope: !170)
!198 = !DILocation(line: 125, column: 20, scope: !170)
!199 = !DILocation(line: 125, column: 9, scope: !170)
!200 = !DILocation(line: 127, column: 1, scope: !153)
