; ModuleID = './juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_08.c'
source_filename = "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_loop_08_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !24
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !24
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !25
  store i8 0, i8* %arrayidx, align 1, !dbg !26
  %call = call i32 @staticReturnsTrue(), !dbg !27
  %tobool = icmp ne i32 %call, 0, !dbg !27
  br i1 %tobool, label %if.then, label %if.end, !dbg !29

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !30
  %add.ptr = getelementptr inbounds i8, i8* %arraydecay1, i64 -8, !dbg !32
  store i8* %add.ptr, i8** %data, align 8, !dbg !33
  br label %if.end, !dbg !34

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !35, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !41, metadata !DIExpression()), !dbg !42
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !43
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !43
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !44
  store i8 0, i8* %arrayidx3, align 1, !dbg !45
  store i64 0, i64* %i, align 8, !dbg !46
  br label %for.cond, !dbg !48

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !49
  %cmp = icmp ult i64 %0, 100, !dbg !51
  br i1 %cmp, label %for.body, label %for.end, !dbg !52

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !53
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !55
  %2 = load i8, i8* %arrayidx4, align 1, !dbg !55
  %3 = load i8*, i8** %data, align 8, !dbg !56
  %4 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx5 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !56
  store i8 %2, i8* %arrayidx5, align 1, !dbg !58
  br label %for.inc, !dbg !59

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !60
  %inc = add i64 %5, 1, !dbg !60
  store i64 %inc, i64* %i, align 8, !dbg !60
  br label %for.cond, !dbg !61, !llvm.loop !62

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !65
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !65
  store i8 0, i8* %arrayidx6, align 1, !dbg !66
  %7 = load i8*, i8** %data, align 8, !dbg !67
  call void @printLine(i8* %7), !dbg !68
  ret void, !dbg !69
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE124_Buffer_Underwrite__char_declare_loop_08_good() #0 !dbg !70 {
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
  call void @CWE124_Buffer_Underwrite__char_declare_loop_08_good(), !dbg !87
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !89
  call void @CWE124_Buffer_Underwrite__char_declare_loop_08_bad(), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !91
  ret i32 0, !dbg !92
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !93 {
entry:
  ret i32 1, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !97 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !98, metadata !DIExpression()), !dbg !99
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !100, metadata !DIExpression()), !dbg !101
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !102
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !102
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  %call = call i32 @staticReturnsFalse(), !dbg !105
  %tobool = icmp ne i32 %call, 0, !dbg !105
  br i1 %tobool, label %if.then, label %if.else, !dbg !107

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !108
  br label %if.end, !dbg !110

if.else:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !111
  store i8* %arraydecay1, i8** %data, align 8, !dbg !113
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !114, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !117, metadata !DIExpression()), !dbg !118
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !119
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !120
  store i8 0, i8* %arrayidx3, align 1, !dbg !121
  store i64 0, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !125
  %cmp = icmp ult i64 %0, 100, !dbg !127
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !129
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !131
  %2 = load i8, i8* %arrayidx4, align 1, !dbg !131
  %3 = load i8*, i8** %data, align 8, !dbg !132
  %4 = load i64, i64* %i, align 8, !dbg !133
  %arrayidx5 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !132
  store i8 %2, i8* %arrayidx5, align 1, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !136
  %inc = add i64 %5, 1, !dbg !136
  store i64 %inc, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !140
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !140
  store i8 0, i8* %arrayidx6, align 1, !dbg !141
  %7 = load i8*, i8** %data, align 8, !dbg !142
  call void @printLine(i8* %7), !dbg !143
  ret void, !dbg !144
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !145 {
entry:
  ret i32 0, !dbg !146
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !147 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %source = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataBuffer, metadata !150, metadata !DIExpression()), !dbg !151
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !152
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 99, i1 false), !dbg !152
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 99, !dbg !153
  store i8 0, i8* %arrayidx, align 1, !dbg !154
  %call = call i32 @staticReturnsTrue(), !dbg !155
  %tobool = icmp ne i32 %call, 0, !dbg !155
  br i1 %tobool, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %entry
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataBuffer, i64 0, i64 0, !dbg !158
  store i8* %arraydecay1, i8** %data, align 8, !dbg !160
  br label %if.end, !dbg !161

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !162, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata [100 x i8]* %source, metadata !165, metadata !DIExpression()), !dbg !166
  %arraydecay2 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 0, !dbg !167
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay2, i8 67, i64 99, i1 false), !dbg !167
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 99, !dbg !168
  store i8 0, i8* %arrayidx3, align 1, !dbg !169
  store i64 0, i64* %i, align 8, !dbg !170
  br label %for.cond, !dbg !172

for.cond:                                         ; preds = %for.inc, %if.end
  %0 = load i64, i64* %i, align 8, !dbg !173
  %cmp = icmp ult i64 %0, 100, !dbg !175
  br i1 %cmp, label %for.body, label %for.end, !dbg !176

for.body:                                         ; preds = %for.cond
  %1 = load i64, i64* %i, align 8, !dbg !177
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %source, i64 0, i64 %1, !dbg !179
  %2 = load i8, i8* %arrayidx4, align 1, !dbg !179
  %3 = load i8*, i8** %data, align 8, !dbg !180
  %4 = load i64, i64* %i, align 8, !dbg !181
  %arrayidx5 = getelementptr inbounds i8, i8* %3, i64 %4, !dbg !180
  store i8 %2, i8* %arrayidx5, align 1, !dbg !182
  br label %for.inc, !dbg !183

for.inc:                                          ; preds = %for.body
  %5 = load i64, i64* %i, align 8, !dbg !184
  %inc = add i64 %5, 1, !dbg !184
  store i64 %inc, i64* %i, align 8, !dbg !184
  br label %for.cond, !dbg !185, !llvm.loop !186

for.end:                                          ; preds = %for.cond
  %6 = load i8*, i8** %data, align 8, !dbg !188
  %arrayidx6 = getelementptr inbounds i8, i8* %6, i64 99, !dbg !188
  store i8 0, i8* %arrayidx6, align 1, !dbg !189
  %7 = load i8*, i8** %data, align 8, !dbg !190
  call void @printLine(i8* %7), !dbg !191
  ret void, !dbg !192
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_loop_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE124_Buffer_Underwrite__char_declare_loop_08.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 39, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBuffer", scope: !11, file: !12, line: 40, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 100)
!23 = !DILocation(line: 40, column: 10, scope: !11)
!24 = !DILocation(line: 41, column: 5, scope: !11)
!25 = !DILocation(line: 42, column: 5, scope: !11)
!26 = !DILocation(line: 42, column: 23, scope: !11)
!27 = !DILocation(line: 43, column: 8, scope: !28)
!28 = distinct !DILexicalBlock(scope: !11, file: !12, line: 43, column: 8)
!29 = !DILocation(line: 43, column: 8, scope: !11)
!30 = !DILocation(line: 46, column: 16, scope: !31)
!31 = distinct !DILexicalBlock(scope: !28, file: !12, line: 44, column: 5)
!32 = !DILocation(line: 46, column: 27, scope: !31)
!33 = !DILocation(line: 46, column: 14, scope: !31)
!34 = !DILocation(line: 47, column: 5, scope: !31)
!35 = !DILocalVariable(name: "i", scope: !36, file: !12, line: 49, type: !37)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 48, column: 5)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !38, line: 46, baseType: !39)
!38 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!39 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!40 = !DILocation(line: 49, column: 16, scope: !36)
!41 = !DILocalVariable(name: "source", scope: !36, file: !12, line: 50, type: !20)
!42 = !DILocation(line: 50, column: 14, scope: !36)
!43 = !DILocation(line: 51, column: 9, scope: !36)
!44 = !DILocation(line: 52, column: 9, scope: !36)
!45 = !DILocation(line: 52, column: 23, scope: !36)
!46 = !DILocation(line: 54, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !36, file: !12, line: 54, column: 9)
!48 = !DILocation(line: 54, column: 14, scope: !47)
!49 = !DILocation(line: 54, column: 21, scope: !50)
!50 = distinct !DILexicalBlock(scope: !47, file: !12, line: 54, column: 9)
!51 = !DILocation(line: 54, column: 23, scope: !50)
!52 = !DILocation(line: 54, column: 9, scope: !47)
!53 = !DILocation(line: 56, column: 30, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !12, line: 55, column: 9)
!55 = !DILocation(line: 56, column: 23, scope: !54)
!56 = !DILocation(line: 56, column: 13, scope: !54)
!57 = !DILocation(line: 56, column: 18, scope: !54)
!58 = !DILocation(line: 56, column: 21, scope: !54)
!59 = !DILocation(line: 57, column: 9, scope: !54)
!60 = !DILocation(line: 54, column: 31, scope: !50)
!61 = !DILocation(line: 54, column: 9, scope: !50)
!62 = distinct !{!62, !52, !63, !64}
!63 = !DILocation(line: 57, column: 9, scope: !47)
!64 = !{!"llvm.loop.mustprogress"}
!65 = !DILocation(line: 59, column: 9, scope: !36)
!66 = !DILocation(line: 59, column: 21, scope: !36)
!67 = !DILocation(line: 60, column: 19, scope: !36)
!68 = !DILocation(line: 60, column: 9, scope: !36)
!69 = !DILocation(line: 62, column: 1, scope: !11)
!70 = distinct !DISubprogram(name: "CWE124_Buffer_Underwrite__char_declare_loop_08_good", scope: !12, file: !12, line: 129, type: !13, scopeLine: 130, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!71 = !DILocation(line: 131, column: 5, scope: !70)
!72 = !DILocation(line: 132, column: 5, scope: !70)
!73 = !DILocation(line: 133, column: 1, scope: !70)
!74 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 145, type: !75, scopeLine: 146, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!75 = !DISubroutineType(types: !76)
!76 = !{!77, !77, !78}
!77 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!78 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!79 = !DILocalVariable(name: "argc", arg: 1, scope: !74, file: !12, line: 145, type: !77)
!80 = !DILocation(line: 145, column: 14, scope: !74)
!81 = !DILocalVariable(name: "argv", arg: 2, scope: !74, file: !12, line: 145, type: !78)
!82 = !DILocation(line: 145, column: 27, scope: !74)
!83 = !DILocation(line: 148, column: 22, scope: !74)
!84 = !DILocation(line: 148, column: 12, scope: !74)
!85 = !DILocation(line: 148, column: 5, scope: !74)
!86 = !DILocation(line: 150, column: 5, scope: !74)
!87 = !DILocation(line: 151, column: 5, scope: !74)
!88 = !DILocation(line: 152, column: 5, scope: !74)
!89 = !DILocation(line: 155, column: 5, scope: !74)
!90 = !DILocation(line: 156, column: 5, scope: !74)
!91 = !DILocation(line: 157, column: 5, scope: !74)
!92 = !DILocation(line: 159, column: 5, scope: !74)
!93 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !94, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!94 = !DISubroutineType(types: !95)
!95 = !{!77}
!96 = !DILocation(line: 27, column: 5, scope: !93)
!97 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 69, type: !13, scopeLine: 70, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DILocalVariable(name: "data", scope: !97, file: !12, line: 71, type: !16)
!99 = !DILocation(line: 71, column: 12, scope: !97)
!100 = !DILocalVariable(name: "dataBuffer", scope: !97, file: !12, line: 72, type: !20)
!101 = !DILocation(line: 72, column: 10, scope: !97)
!102 = !DILocation(line: 73, column: 5, scope: !97)
!103 = !DILocation(line: 74, column: 5, scope: !97)
!104 = !DILocation(line: 74, column: 23, scope: !97)
!105 = !DILocation(line: 75, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !97, file: !12, line: 75, column: 8)
!107 = !DILocation(line: 75, column: 8, scope: !97)
!108 = !DILocation(line: 78, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !12, line: 76, column: 5)
!110 = !DILocation(line: 79, column: 5, scope: !109)
!111 = !DILocation(line: 83, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !106, file: !12, line: 81, column: 5)
!113 = !DILocation(line: 83, column: 14, scope: !112)
!114 = !DILocalVariable(name: "i", scope: !115, file: !12, line: 86, type: !37)
!115 = distinct !DILexicalBlock(scope: !97, file: !12, line: 85, column: 5)
!116 = !DILocation(line: 86, column: 16, scope: !115)
!117 = !DILocalVariable(name: "source", scope: !115, file: !12, line: 87, type: !20)
!118 = !DILocation(line: 87, column: 14, scope: !115)
!119 = !DILocation(line: 88, column: 9, scope: !115)
!120 = !DILocation(line: 89, column: 9, scope: !115)
!121 = !DILocation(line: 89, column: 23, scope: !115)
!122 = !DILocation(line: 91, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !115, file: !12, line: 91, column: 9)
!124 = !DILocation(line: 91, column: 14, scope: !123)
!125 = !DILocation(line: 91, column: 21, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !12, line: 91, column: 9)
!127 = !DILocation(line: 91, column: 23, scope: !126)
!128 = !DILocation(line: 91, column: 9, scope: !123)
!129 = !DILocation(line: 93, column: 30, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !12, line: 92, column: 9)
!131 = !DILocation(line: 93, column: 23, scope: !130)
!132 = !DILocation(line: 93, column: 13, scope: !130)
!133 = !DILocation(line: 93, column: 18, scope: !130)
!134 = !DILocation(line: 93, column: 21, scope: !130)
!135 = !DILocation(line: 94, column: 9, scope: !130)
!136 = !DILocation(line: 91, column: 31, scope: !126)
!137 = !DILocation(line: 91, column: 9, scope: !126)
!138 = distinct !{!138, !128, !139, !64}
!139 = !DILocation(line: 94, column: 9, scope: !123)
!140 = !DILocation(line: 96, column: 9, scope: !115)
!141 = !DILocation(line: 96, column: 21, scope: !115)
!142 = !DILocation(line: 97, column: 19, scope: !115)
!143 = !DILocation(line: 97, column: 9, scope: !115)
!144 = !DILocation(line: 99, column: 1, scope: !97)
!145 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !94, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!146 = !DILocation(line: 32, column: 5, scope: !145)
!147 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 102, type: !13, scopeLine: 103, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!148 = !DILocalVariable(name: "data", scope: !147, file: !12, line: 104, type: !16)
!149 = !DILocation(line: 104, column: 12, scope: !147)
!150 = !DILocalVariable(name: "dataBuffer", scope: !147, file: !12, line: 105, type: !20)
!151 = !DILocation(line: 105, column: 10, scope: !147)
!152 = !DILocation(line: 106, column: 5, scope: !147)
!153 = !DILocation(line: 107, column: 5, scope: !147)
!154 = !DILocation(line: 107, column: 23, scope: !147)
!155 = !DILocation(line: 108, column: 8, scope: !156)
!156 = distinct !DILexicalBlock(scope: !147, file: !12, line: 108, column: 8)
!157 = !DILocation(line: 108, column: 8, scope: !147)
!158 = !DILocation(line: 111, column: 16, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !12, line: 109, column: 5)
!160 = !DILocation(line: 111, column: 14, scope: !159)
!161 = !DILocation(line: 112, column: 5, scope: !159)
!162 = !DILocalVariable(name: "i", scope: !163, file: !12, line: 114, type: !37)
!163 = distinct !DILexicalBlock(scope: !147, file: !12, line: 113, column: 5)
!164 = !DILocation(line: 114, column: 16, scope: !163)
!165 = !DILocalVariable(name: "source", scope: !163, file: !12, line: 115, type: !20)
!166 = !DILocation(line: 115, column: 14, scope: !163)
!167 = !DILocation(line: 116, column: 9, scope: !163)
!168 = !DILocation(line: 117, column: 9, scope: !163)
!169 = !DILocation(line: 117, column: 23, scope: !163)
!170 = !DILocation(line: 119, column: 16, scope: !171)
!171 = distinct !DILexicalBlock(scope: !163, file: !12, line: 119, column: 9)
!172 = !DILocation(line: 119, column: 14, scope: !171)
!173 = !DILocation(line: 119, column: 21, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !12, line: 119, column: 9)
!175 = !DILocation(line: 119, column: 23, scope: !174)
!176 = !DILocation(line: 119, column: 9, scope: !171)
!177 = !DILocation(line: 121, column: 30, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !12, line: 120, column: 9)
!179 = !DILocation(line: 121, column: 23, scope: !178)
!180 = !DILocation(line: 121, column: 13, scope: !178)
!181 = !DILocation(line: 121, column: 18, scope: !178)
!182 = !DILocation(line: 121, column: 21, scope: !178)
!183 = !DILocation(line: 122, column: 9, scope: !178)
!184 = !DILocation(line: 119, column: 31, scope: !174)
!185 = !DILocation(line: 119, column: 9, scope: !174)
!186 = distinct !{!186, !176, !187, !64}
!187 = !DILocation(line: 122, column: 9, scope: !171)
!188 = !DILocation(line: 124, column: 9, scope: !163)
!189 = !DILocation(line: 124, column: 21, scope: !163)
!190 = !DILocation(line: 125, column: 19, scope: !163)
!191 = !DILocation(line: 125, column: 9, scope: !163)
!192 = !DILocation(line: 127, column: 1, scope: !147)
