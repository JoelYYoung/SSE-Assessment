; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_14.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_loop_14_bad() #0 !dbg !11 {
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
  %0 = load i32, i32* @globalFive, align 4, !dbg !27
  %cmp = icmp eq i32 %0, 5, !dbg !29
  br i1 %cmp, label %if.then, label %if.end, !dbg !30

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !31
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !33
  store i8* %add.ptr, i8** %data, align 8, !dbg !34
  br label %if.end, !dbg !35

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !36, metadata !DIExpression()), !dbg !41
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !42, metadata !DIExpression()), !dbg !43
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !44
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !44
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !45
  store i8 0, i8* %arrayidx3, align 1, !dbg !46
  store i64 0, i64* %i, align 8, !dbg !47
  br label %for.cond, !dbg !49

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !50
  %cmp4 = icmp ult i64 %1, 100, !dbg !52
  br i1 %cmp4, label %for.body, label %for.end, !dbg !53

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !54
  %3 = load i64, i64* %i, align 8, !dbg !56
  %arrayidx5 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !54
  %4 = load i8, i8* %arrayidx5, align 1, !dbg !54
  %5 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !58
  store i8 %4, i8* %arrayidx6, align 1, !dbg !59
  br label %for.inc, !dbg !60

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !61
  %inc = add i64 %6, 1, !dbg !61
  store i64 %inc, i64* %i, align 8, !dbg !61
  br label %for.cond, !dbg !62, !llvm.loop !63

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !66
  store i8 0, i8* %arrayidx7, align 1, !dbg !67
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !68
  call void @printLine(i8* %arraydecay8), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_declare_loop_14_good() #0 !dbg !71 {
entry:
  call void @goodG2B1(), !dbg !72
  call void @goodG2B2(), !dbg !73
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
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !80, metadata !DIExpression()), !dbg !81
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !82, metadata !DIExpression()), !dbg !83
  %call = call i64 @time(i64* null) #5, !dbg !84
  %conv = trunc i64 %call to i32, !dbg !85
  call void @srand(i32 %conv) #5, !dbg !86
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !87
  call void @CWE127_Buffer_Underread__char_declare_loop_14_good(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !90
  call void @CWE127_Buffer_Underread__char_declare_loop_14_bad(), !dbg !91
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !92
  ret i32 0, !dbg !93
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !94 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !95, metadata !DIExpression()), !dbg !96
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !97, metadata !DIExpression()), !dbg !98
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !99
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !99
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !100
  store i8 0, i8* %arrayidx, align 1, !dbg !101
  %0 = load i32, i32* @globalFive, align 4, !dbg !102
  %cmp = icmp ne i32 %0, 5, !dbg !104
  br i1 %cmp, label %if.then, label %if.else, !dbg !105

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !106
  br label %if.end, !dbg !108

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !109
  store i8* %arraydecay1, i8** %data, align 8, !dbg !111
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !112, metadata !DIExpression()), !dbg !114
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !115, metadata !DIExpression()), !dbg !116
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !117
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !117
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !118
  store i8 0, i8* %arrayidx3, align 1, !dbg !119
  store i64 0, i64* %i, align 8, !dbg !120
  br label %for.cond, !dbg !122

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !123
  %cmp4 = icmp ult i64 %1, 100, !dbg !125
  br i1 %cmp4, label %for.body, label %for.end, !dbg !126

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !127
  %3 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx5 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !127
  %4 = load i8, i8* %arrayidx5, align 1, !dbg !127
  %5 = load i64, i64* %i, align 8, !dbg !130
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !131
  store i8 %4, i8* %arrayidx6, align 1, !dbg !132
  br label %for.inc, !dbg !133

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !134
  %inc = add i64 %6, 1, !dbg !134
  store i64 %inc, i64* %i, align 8, !dbg !134
  br label %for.cond, !dbg !135, !llvm.loop !136

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !138
  store i8 0, i8* %arrayidx7, align 1, !dbg !139
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !140
  call void @printLine(i8* %arraydecay8), !dbg !141
  ret void, !dbg !142
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !143 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !144, metadata !DIExpression()), !dbg !145
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !146, metadata !DIExpression()), !dbg !147
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !148
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !149
  store i8 0, i8* %arrayidx, align 1, !dbg !150
  %0 = load i32, i32* @globalFive, align 4, !dbg !151
  %cmp = icmp eq i32 %0, 5, !dbg !153
  br i1 %cmp, label %if.then, label %if.end, !dbg !154

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !155
  store i8* %arraydecay1, i8** %data, align 8, !dbg !157
  br label %if.end, !dbg !158

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !159, metadata !DIExpression()), !dbg !161
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !162, metadata !DIExpression()), !dbg !163
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !164
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !164
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !165
  store i8 0, i8* %arrayidx3, align 1, !dbg !166
  store i64 0, i64* %i, align 8, !dbg !167
  br label %for.cond, !dbg !169

for.cond:                                         ; preds = %for.inc, %if.end
  %1 = load i64, i64* %i, align 8, !dbg !170
  %cmp4 = icmp ult i64 %1, 100, !dbg !172
  br i1 %cmp4, label %for.body, label %for.end, !dbg !173

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data, align 8, !dbg !174
  %3 = load i64, i64* %i, align 8, !dbg !176
  %arrayidx5 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !174
  %4 = load i8, i8* %arrayidx5, align 1, !dbg !174
  %5 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !178
  store i8 %4, i8* %arrayidx6, align 1, !dbg !179
  br label %for.inc, !dbg !180

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !181
  %inc = add i64 %6, 1, !dbg !181
  store i64 %inc, i64* %i, align 8, !dbg !181
  br label %for.cond, !dbg !182, !llvm.loop !183

for.end:                                          ; preds = %for.cond
  %arrayidx7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !185
  store i8 0, i8* %arrayidx7, align 1, !dbg !186
  %arraydecay8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !187
  call void @printLine(i8* %arraydecay8), !dbg !188
  ret void, !dbg !189
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_loop_14_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_declare_loop_14.c", directory: "/home/joelyang/SSE-Assessment")
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
!29 = !DILocation(line: 29, column: 18, scope: !28)
!30 = !DILocation(line: 29, column: 8, scope: !11)
!31 = !DILocation(line: 32, column: 16, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !12, line: 30, column: 5)
!33 = !DILocation(line: 32, column: 27, scope: !32)
!34 = !DILocation(line: 32, column: 14, scope: !32)
!35 = !DILocation(line: 33, column: 5, scope: !32)
!36 = !DILocalVariable(name: "i", scope: !37, file: !12, line: 35, type: !38)
!37 = distinct !DILexicalBlock(scope: !11, file: !12, line: 34, column: 5)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !39, line: 46, baseType: !40)
!39 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!40 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!41 = !DILocation(line: 35, column: 16, scope: !37)
!42 = !DILocalVariable(name: "dest", scope: !37, file: !12, line: 36, type: !20)
!43 = !DILocation(line: 36, column: 14, scope: !37)
!44 = !DILocation(line: 37, column: 9, scope: !37)
!45 = !DILocation(line: 38, column: 9, scope: !37)
!46 = !DILocation(line: 38, column: 21, scope: !37)
!47 = !DILocation(line: 40, column: 16, scope: !48)
!48 = distinct !DILexicalBlock(scope: !37, file: !12, line: 40, column: 9)
!49 = !DILocation(line: 40, column: 14, scope: !48)
!50 = !DILocation(line: 40, column: 21, scope: !51)
!51 = distinct !DILexicalBlock(scope: !48, file: !12, line: 40, column: 9)
!52 = !DILocation(line: 40, column: 23, scope: !51)
!53 = !DILocation(line: 40, column: 9, scope: !48)
!54 = !DILocation(line: 42, column: 23, scope: !55)
!55 = distinct !DILexicalBlock(scope: !51, file: !12, line: 41, column: 9)
!56 = !DILocation(line: 42, column: 28, scope: !55)
!57 = !DILocation(line: 42, column: 18, scope: !55)
!58 = !DILocation(line: 42, column: 13, scope: !55)
!59 = !DILocation(line: 42, column: 21, scope: !55)
!60 = !DILocation(line: 43, column: 9, scope: !55)
!61 = !DILocation(line: 40, column: 31, scope: !51)
!62 = !DILocation(line: 40, column: 9, scope: !51)
!63 = distinct !{!63, !53, !64, !65}
!64 = !DILocation(line: 43, column: 9, scope: !48)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 45, column: 9, scope: !37)
!67 = !DILocation(line: 45, column: 21, scope: !37)
!68 = !DILocation(line: 46, column: 19, scope: !37)
!69 = !DILocation(line: 46, column: 9, scope: !37)
!70 = !DILocation(line: 48, column: 1, scope: !11)
!71 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_declare_loop_14_good", scope: !12, file: !12, line: 115, type: !13, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!72 = !DILocation(line: 117, column: 5, scope: !71)
!73 = !DILocation(line: 118, column: 5, scope: !71)
!74 = !DILocation(line: 119, column: 1, scope: !71)
!75 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 131, type: !76, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!76 = !DISubroutineType(types: !77)
!77 = !{!78, !78, !79}
!78 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!79 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!80 = !DILocalVariable(name: "argc", arg: 1, scope: !75, file: !12, line: 131, type: !78)
!81 = !DILocation(line: 131, column: 14, scope: !75)
!82 = !DILocalVariable(name: "argv", arg: 2, scope: !75, file: !12, line: 131, type: !79)
!83 = !DILocation(line: 131, column: 27, scope: !75)
!84 = !DILocation(line: 134, column: 22, scope: !75)
!85 = !DILocation(line: 134, column: 12, scope: !75)
!86 = !DILocation(line: 134, column: 5, scope: !75)
!87 = !DILocation(line: 136, column: 5, scope: !75)
!88 = !DILocation(line: 137, column: 5, scope: !75)
!89 = !DILocation(line: 138, column: 5, scope: !75)
!90 = !DILocation(line: 141, column: 5, scope: !75)
!91 = !DILocation(line: 142, column: 5, scope: !75)
!92 = !DILocation(line: 143, column: 5, scope: !75)
!93 = !DILocation(line: 145, column: 5, scope: !75)
!94 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 55, type: !13, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocalVariable(name: "data", scope: !94, file: !12, line: 57, type: !16)
!96 = !DILocation(line: 57, column: 12, scope: !94)
!97 = !DILocalVariable(name: "dataBuffer", scope: !94, file: !12, line: 58, type: !20)
!98 = !DILocation(line: 58, column: 10, scope: !94)
!99 = !DILocation(line: 59, column: 5, scope: !94)
!100 = !DILocation(line: 60, column: 5, scope: !94)
!101 = !DILocation(line: 60, column: 23, scope: !94)
!102 = !DILocation(line: 61, column: 8, scope: !103)
!103 = distinct !DILexicalBlock(scope: !94, file: !12, line: 61, column: 8)
!104 = !DILocation(line: 61, column: 18, scope: !103)
!105 = !DILocation(line: 61, column: 8, scope: !94)
!106 = !DILocation(line: 64, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !103, file: !12, line: 62, column: 5)
!108 = !DILocation(line: 65, column: 5, scope: !107)
!109 = !DILocation(line: 69, column: 16, scope: !110)
!110 = distinct !DILexicalBlock(scope: !103, file: !12, line: 67, column: 5)
!111 = !DILocation(line: 69, column: 14, scope: !110)
!112 = !DILocalVariable(name: "i", scope: !113, file: !12, line: 72, type: !38)
!113 = distinct !DILexicalBlock(scope: !94, file: !12, line: 71, column: 5)
!114 = !DILocation(line: 72, column: 16, scope: !113)
!115 = !DILocalVariable(name: "dest", scope: !113, file: !12, line: 73, type: !20)
!116 = !DILocation(line: 73, column: 14, scope: !113)
!117 = !DILocation(line: 74, column: 9, scope: !113)
!118 = !DILocation(line: 75, column: 9, scope: !113)
!119 = !DILocation(line: 75, column: 21, scope: !113)
!120 = !DILocation(line: 77, column: 16, scope: !121)
!121 = distinct !DILexicalBlock(scope: !113, file: !12, line: 77, column: 9)
!122 = !DILocation(line: 77, column: 14, scope: !121)
!123 = !DILocation(line: 77, column: 21, scope: !124)
!124 = distinct !DILexicalBlock(scope: !121, file: !12, line: 77, column: 9)
!125 = !DILocation(line: 77, column: 23, scope: !124)
!126 = !DILocation(line: 77, column: 9, scope: !121)
!127 = !DILocation(line: 79, column: 23, scope: !128)
!128 = distinct !DILexicalBlock(scope: !124, file: !12, line: 78, column: 9)
!129 = !DILocation(line: 79, column: 28, scope: !128)
!130 = !DILocation(line: 79, column: 18, scope: !128)
!131 = !DILocation(line: 79, column: 13, scope: !128)
!132 = !DILocation(line: 79, column: 21, scope: !128)
!133 = !DILocation(line: 80, column: 9, scope: !128)
!134 = !DILocation(line: 77, column: 31, scope: !124)
!135 = !DILocation(line: 77, column: 9, scope: !124)
!136 = distinct !{!136, !126, !137, !65}
!137 = !DILocation(line: 80, column: 9, scope: !121)
!138 = !DILocation(line: 82, column: 9, scope: !113)
!139 = !DILocation(line: 82, column: 21, scope: !113)
!140 = !DILocation(line: 83, column: 19, scope: !113)
!141 = !DILocation(line: 83, column: 9, scope: !113)
!142 = !DILocation(line: 85, column: 1, scope: !94)
!143 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 88, type: !13, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!144 = !DILocalVariable(name: "data", scope: !143, file: !12, line: 90, type: !16)
!145 = !DILocation(line: 90, column: 12, scope: !143)
!146 = !DILocalVariable(name: "dataBuffer", scope: !143, file: !12, line: 91, type: !20)
!147 = !DILocation(line: 91, column: 10, scope: !143)
!148 = !DILocation(line: 92, column: 5, scope: !143)
!149 = !DILocation(line: 93, column: 5, scope: !143)
!150 = !DILocation(line: 93, column: 23, scope: !143)
!151 = !DILocation(line: 94, column: 8, scope: !152)
!152 = distinct !DILexicalBlock(scope: !143, file: !12, line: 94, column: 8)
!153 = !DILocation(line: 94, column: 18, scope: !152)
!154 = !DILocation(line: 94, column: 8, scope: !143)
!155 = !DILocation(line: 97, column: 16, scope: !156)
!156 = distinct !DILexicalBlock(scope: !152, file: !12, line: 95, column: 5)
!157 = !DILocation(line: 97, column: 14, scope: !156)
!158 = !DILocation(line: 98, column: 5, scope: !156)
!159 = !DILocalVariable(name: "i", scope: !160, file: !12, line: 100, type: !38)
!160 = distinct !DILexicalBlock(scope: !143, file: !12, line: 99, column: 5)
!161 = !DILocation(line: 100, column: 16, scope: !160)
!162 = !DILocalVariable(name: "dest", scope: !160, file: !12, line: 101, type: !20)
!163 = !DILocation(line: 101, column: 14, scope: !160)
!164 = !DILocation(line: 102, column: 9, scope: !160)
!165 = !DILocation(line: 103, column: 9, scope: !160)
!166 = !DILocation(line: 103, column: 21, scope: !160)
!167 = !DILocation(line: 105, column: 16, scope: !168)
!168 = distinct !DILexicalBlock(scope: !160, file: !12, line: 105, column: 9)
!169 = !DILocation(line: 105, column: 14, scope: !168)
!170 = !DILocation(line: 105, column: 21, scope: !171)
!171 = distinct !DILexicalBlock(scope: !168, file: !12, line: 105, column: 9)
!172 = !DILocation(line: 105, column: 23, scope: !171)
!173 = !DILocation(line: 105, column: 9, scope: !168)
!174 = !DILocation(line: 107, column: 23, scope: !175)
!175 = distinct !DILexicalBlock(scope: !171, file: !12, line: 106, column: 9)
!176 = !DILocation(line: 107, column: 28, scope: !175)
!177 = !DILocation(line: 107, column: 18, scope: !175)
!178 = !DILocation(line: 107, column: 13, scope: !175)
!179 = !DILocation(line: 107, column: 21, scope: !175)
!180 = !DILocation(line: 108, column: 9, scope: !175)
!181 = !DILocation(line: 105, column: 31, scope: !171)
!182 = !DILocation(line: 105, column: 9, scope: !171)
!183 = distinct !{!183, !173, !184, !65}
!184 = !DILocation(line: 108, column: 9, scope: !168)
!185 = !DILocation(line: 110, column: 9, scope: !160)
!186 = !DILocation(line: 110, column: 21, scope: !160)
!187 = !DILocation(line: 111, column: 19, scope: !160)
!188 = !DILocation(line: 111, column: 9, scope: !160)
!189 = !DILocation(line: 113, column: 1, scope: !143)
