; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_09.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_09.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = external dso_local constant i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@GLOBAL_CONST_FALSE = external dso_local constant i32, align 4
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_loop_09_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !24
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !25
  store i8 0, i8* %arrayidx, align 1, !dbg !26
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !27
  %tobool = icmp ne i32 %0, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !30
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !32
  store i8* %add.ptr, i8** %data, align 8, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !41, metadata !DIExpression()), !dbg !42
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !43
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !44
  store i8 0, i8* %arrayidx3, align 1, !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %1, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !53
  %3 = load i64, i64* %i, align 8, !dbg !55
  %arrayidx4 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !53
  %4 = load i8, i8* %arrayidx4, align 1, !dbg !53
  %5 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !57
  store i8 %4, i8* %arrayidx5, align 1, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %6, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !65
  store i8 0, i8* %arrayidx6, align 1, !dbg !66
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !67
  call void @printLine(i8* %arraydecay7), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_loop_09_good() #0 !dbg !70 {
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !79, metadata !DIExpression()), !dbg !80
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !81, metadata !DIExpression()), !dbg !82
  %call = call i64 @time(i64* null) #5, !dbg !83
  %conv = trunc i64 %call to i32, !dbg !84
  call void @srand(i32 %conv) #5, !dbg !85
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !86
  call void @CWE127_Buffer_Underread__char_declare_loop_09_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE127_Buffer_Underread__char_declare_loop_09_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !93 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !98
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !98
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !99
  store i8 0, i8* %arrayidx, align 1, !dbg !100
  %0 = load i32, i32* @GLOBAL_CONST_FALSE, align 4, !dbg !101
  %tobool = icmp ne i32 %0, 0, !dbg !101
  br i1 %tobool, label %if.then, label %if.else, !dbg !103

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !104
  br label %if.end, !dbg !106

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !107
  store i8* %arraydecay1, i8** %data, align 8, !dbg !109
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !110, metadata !DIExpression()), !dbg !112
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !113, metadata !DIExpression()), !dbg !114
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !115
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !115
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !116
  store i8 0, i8* %arrayidx3, align 1, !dbg !117
  store i64 0, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !120

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !121
  %cmp = icmp ult i64 %1, 100, !dbg !123
  br i1 %cmp, label %for.body, label %for.end, !dbg !124

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !125
  %3 = load i64, i64* %i, align 8, !dbg !127
  %arrayidx4 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !125
  %4 = load i8, i8* %arrayidx4, align 1, !dbg !125
  %5 = load i64, i64* %i, align 8, !dbg !128
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !129
  store i8 %4, i8* %arrayidx5, align 1, !dbg !130
  br label %for.inc, !dbg !131

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !132
  %inc = add i64 %6, 1, !dbg !132
  store i64 %inc, i64* %i, align 8, !dbg !132
  br label %for.cond, !dbg !133, !llvm.loop !134

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !136
  store i8 0, i8* %arrayidx6, align 1, !dbg !137
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !138
  call void @printLine(i8* %arraydecay7), !dbg !139
  ret void, !dbg !140
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !141 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !142, metadata !DIExpression()), !dbg !143
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !144, metadata !DIExpression()), !dbg !145
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !146
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !146
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !147
  store i8 0, i8* %arrayidx, align 1, !dbg !148
  %0 = load i32, i32* @GLOBAL_CONST_TRUE, align 4, !dbg !149
  %tobool = icmp ne i32 %0, 0, !dbg !149
  br i1 %tobool, label %if.then, label %if.end, !dbg !151

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !152
  store i8* %arraydecay1, i8** %data, align 8, !dbg !154
  br label %if.end, !dbg !155

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !156, metadata !DIExpression()), !dbg !158
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !159, metadata !DIExpression()), !dbg !160
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !161
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !161
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !162
  store i8 0, i8* %arrayidx3, align 1, !dbg !163
  store i64 0, i64* %i, align 8, !dbg !164
  br label %for.cond, !dbg !166

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !167
  %cmp = icmp ult i64 %1, 100, !dbg !169
  br i1 %cmp, label %for.body, label %for.end, !dbg !170

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !171
  %3 = load i64, i64* %i, align 8, !dbg !173
  %arrayidx4 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !171
  %4 = load i8, i8* %arrayidx4, align 1, !dbg !171
  %5 = load i64, i64* %i, align 8, !dbg !174
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !175
  store i8 %4, i8* %arrayidx5, align 1, !dbg !176
  br label %for.inc, !dbg !177

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !178
  %inc = add i64 %6, 1, !dbg !178
  store i64 %inc, i64* %i, align 8, !dbg !178
  br label %for.cond, !dbg !179, !llvm.loop !180

for.end:                                          ; preds = %for.cond
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !182
  store i8 0, i8* %arrayidx6, align 1, !dbg !183
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !184
  call void @printLine(i8* %arraydecay7), !dbg !185
  ret void, !dbg !186
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_09.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_loop_09_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_09.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocation(line: 27, column: 5, scope: !11)
!25 = !DILocation(line: 28, column: 5, scope: !11)
!26 = !DILocation(line: 28, column: 23, scope: !11)
!27 = !DILocation(line: 29, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 29, column: 8)
!29 = !DILocation(line: 29, column: 8, scope: !11)
!30 = !DILocation(line: 32, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !12, line: 30, column: 5)
!32 = !DILocation(line: 32, column: 27, scope: !31)
!33 = !DILocation(line: 32, column: 14, scope: !31)
!34 = !DILocation(line: 33, column: 5, scope: !31)
!35 = !DILocalVariable(name: "i", scope: !36, file: !12, line: 35, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 35, column: 16, scope: !36)
!41 = !DILocalVariable(name: "dest", scope: !36, file: !12, line: 36, type: !20)
!42 = !DILocation(line: 36, column: 14, scope: !36)
!43 = !DILocation(line: 37, column: 9, scope: !36)
!44 = !DILocation(line: 38, column: 9, scope: !36)
!45 = !DILocation(line: 38, column: 21, scope: !36)
!46 = !DILocation(line: 40, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !36, file: !12, line: 40, column: 9)
!48 = !DILocation(line: 40, column: 14, scope: !47)
!49 = !DILocation(line: 40, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !12, line: 40, column: 9)
!51 = !DILocation(line: 40, column: 23, scope: !50)
!52 = !DILocation(line: 40, column: 9, scope: !47)
!53 = !DILocation(line: 42, column: 23, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !12, line: 41, column: 9)
!55 = !DILocation(line: 42, column: 28, scope: !54)
!56 = !DILocation(line: 42, column: 18, scope: !54)
!57 = !DILocation(line: 42, column: 13, scope: !54)
!58 = !DILocation(line: 42, column: 21, scope: !54)
!59 = !DILocation(line: 43, column: 9, scope: !54)
!60 = !DILocation(line: 40, column: 31, scope: !50)
!61 = !DILocation(line: 40, column: 9, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 43, column: 9, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 45, column: 9, scope: !36)
!66 = !DILocation(line: 45, column: 21, scope: !36)
!67 = !DILocation(line: 46, column: 19, scope: !36)
!68 = !DILocation(line: 46, column: 9, scope: !36)
!69 = !DILocation(line: 48, column: 1, scope: !11)
!70 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_loop_09_good", scope: !12, file: !12, line: 115, type: !13, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 117, column: 5, scope: !70)
!72 = !DILocation(line: 118, column: 5, scope: !70)
!73 = !DILocation(line: 119, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 131, type: !75, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!77, !77, !78}
!77 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !12, line: 131, type: !77)
!80 = !DILocation(line: 131, column: 14, scope: !74)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !12, line: 131, type: !78)
!82 = !DILocation(line: 131, column: 27, scope: !74)
!83 = !DILocation(line: 134, column: 22, scope: !74)
!84 = !DILocation(line: 134, column: 12, scope: !74)
!85 = !DILocation(line: 134, column: 5, scope: !74)
!86 = !DILocation(line: 136, column: 5, scope: !74)
!87 = !DILocation(line: 137, column: 5, scope: !74)
!88 = !DILocation(line: 138, column: 5, scope: !74)
!89 = !DILocation(line: 141, column: 5, scope: !74)
!90 = !DILocation(line: 142, column: 5, scope: !74)
!91 = !DILocation(line: 143, column: 5, scope: !74)
!92 = !DILocation(line: 145, column: 5, scope: !74)
!93 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DILocalVariable(name: "data", scope: !93, file: !12, line: 57, type: !16)
!95 = !DILocation(line: 57, column: 12, scope: !93)
!96 = !DILocalVariable(name: "dataBuffer", scope: !93, file: !12, line: 58, type: !20)
!97 = !DILocation(line: 58, column: 10, scope: !93)
!98 = !DILocation(line: 59, column: 5, scope: !93)
!99 = !DILocation(line: 60, column: 5, scope: !93)
!100 = !DILocation(line: 60, column: 23, scope: !93)
!101 = !DILocation(line: 61, column: 8, scope: !102)
!102 = distinct !DILexicalBlock(scope: !93, file: !12, line: 61, column: 8)
!103 = !DILocation(line: 61, column: 8, scope: !93)
!104 = !DILocation(line: 64, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !102, file: !12, line: 62, column: 5)
!106 = !DILocation(line: 65, column: 5, scope: !105)
!107 = !DILocation(line: 69, column: 16, scope: !108)
!108 = distinct !DILexicalBlock(scope: !102, file: !12, line: 67, column: 5)
!109 = !DILocation(line: 69, column: 14, scope: !108)
!110 = !DILocalVariable(name: "i", scope: !111, file: !12, line: 72, type: !37)
!111 = distinct !DILexicalBlock(scope: !93, file: !12, line: 71, column: 5)
!112 = !DILocation(line: 72, column: 16, scope: !111)
!113 = !DILocalVariable(name: "dest", scope: !111, file: !12, line: 73, type: !20)
!114 = !DILocation(line: 73, column: 14, scope: !111)
!115 = !DILocation(line: 74, column: 9, scope: !111)
!116 = !DILocation(line: 75, column: 9, scope: !111)
!117 = !DILocation(line: 75, column: 21, scope: !111)
!118 = !DILocation(line: 77, column: 16, scope: !119)
!119 = distinct !DILexicalBlock(scope: !111, file: !12, line: 77, column: 9)
!120 = !DILocation(line: 77, column: 14, scope: !119)
!121 = !DILocation(line: 77, column: 21, scope: !122)
!122 = distinct !DILexicalBlock(scope: !119, file: !12, line: 77, column: 9)
!123 = !DILocation(line: 77, column: 23, scope: !122)
!124 = !DILocation(line: 77, column: 9, scope: !119)
!125 = !DILocation(line: 79, column: 23, scope: !126)
!126 = distinct !DILexicalBlock(scope: !122, file: !12, line: 78, column: 9)
!127 = !DILocation(line: 79, column: 28, scope: !126)
!128 = !DILocation(line: 79, column: 18, scope: !126)
!129 = !DILocation(line: 79, column: 13, scope: !126)
!130 = !DILocation(line: 79, column: 21, scope: !126)
!131 = !DILocation(line: 80, column: 9, scope: !126)
!132 = !DILocation(line: 77, column: 31, scope: !122)
!133 = !DILocation(line: 77, column: 9, scope: !122)
!134 = distinct !{!134, !124, !135, !64}
!135 = !DILocation(line: 80, column: 9, scope: !119)
!136 = !DILocation(line: 82, column: 9, scope: !111)
!137 = !DILocation(line: 82, column: 21, scope: !111)
!138 = !DILocation(line: 83, column: 19, scope: !111)
!139 = !DILocation(line: 83, column: 9, scope: !111)
!140 = !DILocation(line: 85, column: 1, scope: !93)
!141 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!142 = !DILocalVariable(name: "data", scope: !141, file: !12, line: 90, type: !16)
!143 = !DILocation(line: 90, column: 12, scope: !141)
!144 = !DILocalVariable(name: "dataBuffer", scope: !141, file: !12, line: 91, type: !20)
!145 = !DILocation(line: 91, column: 10, scope: !141)
!146 = !DILocation(line: 92, column: 5, scope: !141)
!147 = !DILocation(line: 93, column: 5, scope: !141)
!148 = !DILocation(line: 93, column: 23, scope: !141)
!149 = !DILocation(line: 94, column: 8, scope: !150)
!150 = distinct !DILexicalBlock(scope: !141, file: !12, line: 94, column: 8)
!151 = !DILocation(line: 94, column: 8, scope: !141)
!152 = !DILocation(line: 97, column: 16, scope: !153)
!153 = distinct !DILexicalBlock(scope: !150, file: !12, line: 95, column: 5)
!154 = !DILocation(line: 97, column: 14, scope: !153)
!155 = !DILocation(line: 98, column: 5, scope: !153)
!156 = !DILocalVariable(name: "i", scope: !157, file: !12, line: 100, type: !37)
!157 = distinct !DILexicalBlock(scope: !141, file: !12, line: 99, column: 5)
!158 = !DILocation(line: 100, column: 16, scope: !157)
!159 = !DILocalVariable(name: "dest", scope: !157, file: !12, line: 101, type: !20)
!160 = !DILocation(line: 101, column: 14, scope: !157)
!161 = !DILocation(line: 102, column: 9, scope: !157)
!162 = !DILocation(line: 103, column: 9, scope: !157)
!163 = !DILocation(line: 103, column: 21, scope: !157)
!164 = !DILocation(line: 105, column: 16, scope: !165)
!165 = distinct !DILexicalBlock(scope: !157, file: !12, line: 105, column: 9)
!166 = !DILocation(line: 105, column: 14, scope: !165)
!167 = !DILocation(line: 105, column: 21, scope: !168)
!168 = distinct !DILexicalBlock(scope: !165, file: !12, line: 105, column: 9)
!169 = !DILocation(line: 105, column: 23, scope: !168)
!170 = !DILocation(line: 105, column: 9, scope: !165)
!171 = !DILocation(line: 107, column: 23, scope: !172)
!172 = distinct !DILexicalBlock(scope: !168, file: !12, line: 106, column: 9)
!173 = !DILocation(line: 107, column: 28, scope: !172)
!174 = !DILocation(line: 107, column: 18, scope: !172)
!175 = !DILocation(line: 107, column: 13, scope: !172)
!176 = !DILocation(line: 107, column: 21, scope: !172)
!177 = !DILocation(line: 108, column: 9, scope: !172)
!178 = !DILocation(line: 105, column: 31, scope: !168)
!179 = !DILocation(line: 105, column: 9, scope: !168)
!180 = distinct !{!180, !170, !181, !64}
!181 = !DILocation(line: 108, column: 9, scope: !165)
!182 = !DILocation(line: 110, column: 9, scope: !157)
!183 = !DILocation(line: 110, column: 21, scope: !157)
!184 = !DILocation(line: 111, column: 19, scope: !157)
!185 = !DILocation(line: 111, column: 9, scope: !157)
!186 = !DILocation(line: 113, column: 1, scope: !141)
