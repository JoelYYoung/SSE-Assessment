; ModuleID = './juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_11.c'
source_filename = "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_11.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_loop_11_bad() #0 !dbg !13 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !19, metadata !DIExpression()), !dbg !20
  %0 = alloca i8, i64 100, align 16, !dbg !21
  store i8* %0, i8** %dataBuffer, align 8, !dbg !20
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !22
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !23
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !24
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !24
  store i8 0, i8* %arrayidx, align 1, !dbg !25
  %call = call i32 (...) @globalReturnsTrue(), !dbg !26
  %tobool = icmp ne i32 %call, 0, !dbg !26
  br i1 %tobool, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !29
  %add.ptr = getelementptr inbounds i8, i8* %3, i64 -8, !dbg !31
  store i8* %add.ptr, i8** %data, align 8, !dbg !32
  br label %if.end, !dbg !33

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !34, metadata !DIExpression()), !dbg !39
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !40, metadata !DIExpression()), !dbg !44
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !45
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !46
  store i8 0, i8* %arrayidx1, align 1, !dbg !47
  store i64 0, i64* %i, align 8, !dbg !48
  br label %for.cond, !dbg !50

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !51
  %cmp = icmp ult i64 %4, 100, !dbg !53
  br i1 %cmp, label %for.body, label %for.end, !dbg !54

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !55
  %6 = load i64, i64* %i, align 8, !dbg !57
  %arrayidx2 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !55
  %7 = load i8, i8* %arrayidx2, align 1, !dbg !55
  %8 = load i64, i64* %i, align 8, !dbg !58
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !59
  store i8 %7, i8* %arrayidx3, align 1, !dbg !60
  br label %for.inc, !dbg !61

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !62
  %inc = add i64 %9, 1, !dbg !62
  store i64 %inc, i64* %i, align 8, !dbg !62
  br label %for.cond, !dbg !63, !llvm.loop !64

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !67
  store i8 0, i8* %arrayidx4, align 1, !dbg !68
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !69
  call void @printLine(i8* %arraydecay5), !dbg !70
  ret void, !dbg !71
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

declare dso_local i32 @globalReturnsTrue(...) #3

declare dso_local void @printLine(i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE127_Buffer_Underread__char_alloca_loop_11_good() #0 !dbg !72 {
entry:
  call void @goodG2B1(), !dbg !73
  call void @goodG2B2(), !dbg !74
  ret void, !dbg !75
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !76 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !81, metadata !DIExpression()), !dbg !82
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !83, metadata !DIExpression()), !dbg !84
  %call = call i64 @time(i64* null) #5, !dbg !85
  %conv = trunc i64 %call to i32, !dbg !86
  call void @srand(i32 %conv) #5, !dbg !87
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !88
  call void @CWE127_Buffer_Underread__char_alloca_loop_11_good(), !dbg !89
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !90
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !91
  call void @CWE127_Buffer_Underread__char_alloca_loop_11_bad(), !dbg !92
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !93
  ret i32 0, !dbg !94
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #4

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #4

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !95 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !96, metadata !DIExpression()), !dbg !97
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !98, metadata !DIExpression()), !dbg !99
  %0 = alloca i8, i64 100, align 16, !dbg !100
  store i8* %0, i8** %dataBuffer, align 8, !dbg !99
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !101
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !102
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !103
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !103
  store i8 0, i8* %arrayidx, align 1, !dbg !104
  %call = call i32 (...) @globalReturnsFalse(), !dbg !105
  %tobool = icmp ne i32 %call, 0, !dbg !105
  br i1 %tobool, label %if.then, label %if.else, !dbg !107

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !108
  br label %if.end, !dbg !110

if.else:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !111
  store i8* %3, i8** %data, align 8, !dbg !113
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata i64* %i, metadata !114, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !117, metadata !DIExpression()), !dbg !118
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !119
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !119
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !120
  store i8 0, i8* %arrayidx1, align 1, !dbg !121
  store i64 0, i64* %i, align 8, !dbg !122
  br label %for.cond, !dbg !124

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !125
  %cmp = icmp ult i64 %4, 100, !dbg !127
  br i1 %cmp, label %for.body, label %for.end, !dbg !128

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !129
  %6 = load i64, i64* %i, align 8, !dbg !131
  %arrayidx2 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !129
  %7 = load i8, i8* %arrayidx2, align 1, !dbg !129
  %8 = load i64, i64* %i, align 8, !dbg !132
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !133
  store i8 %7, i8* %arrayidx3, align 1, !dbg !134
  br label %for.inc, !dbg !135

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !136
  %inc = add i64 %9, 1, !dbg !136
  store i64 %inc, i64* %i, align 8, !dbg !136
  br label %for.cond, !dbg !137, !llvm.loop !138

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !140
  store i8 0, i8* %arrayidx4, align 1, !dbg !141
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !142
  call void @printLine(i8* %arraydecay5), !dbg !143
  ret void, !dbg !144
}

declare dso_local i32 @globalReturnsFalse(...) #3

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !145 {
entry:
  %data = alloca i8*, align 8
  %dataBuffer = alloca i8*, align 8
  %i = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !146, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata i8** %dataBuffer, metadata !148, metadata !DIExpression()), !dbg !149
  %0 = alloca i8, i64 100, align 16, !dbg !150
  store i8* %0, i8** %dataBuffer, align 8, !dbg !149
  %1 = load i8*, i8** %dataBuffer, align 8, !dbg !151
  call void @llvm.memset.p0i8.i64(i8* align 1 %1, i8 65, i64 99, i1 false), !dbg !152
  %2 = load i8*, i8** %dataBuffer, align 8, !dbg !153
  %arrayidx = getelementptr inbounds i8, i8* %2, i64 99, !dbg !153
  store i8 0, i8* %arrayidx, align 1, !dbg !154
  %call = call i32 (...) @globalReturnsTrue(), !dbg !155
  %tobool = icmp ne i32 %call, 0, !dbg !155
  br i1 %tobool, label %if.then, label %if.end, !dbg !157

if.then:                                          ; preds = %entry
  %3 = load i8*, i8** %dataBuffer, align 8, !dbg !158
  store i8* %3, i8** %data, align 8, !dbg !160
  br label %if.end, !dbg !161

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata i64* %i, metadata !162, metadata !DIExpression()), !dbg !164
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !165, metadata !DIExpression()), !dbg !166
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !167
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !167
  %arrayidx1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !168
  store i8 0, i8* %arrayidx1, align 1, !dbg !169
  store i64 0, i64* %i, align 8, !dbg !170
  br label %for.cond, !dbg !172

for.cond:                                         ; preds = %for.inc, %if.end
  %4 = load i64, i64* %i, align 8, !dbg !173
  %cmp = icmp ult i64 %4, 100, !dbg !175
  br i1 %cmp, label %for.body, label %for.end, !dbg !176

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %data, align 8, !dbg !177
  %6 = load i64, i64* %i, align 8, !dbg !179
  %arrayidx2 = getelementptr inbounds i8, i8* %5, i64 %6, !dbg !177
  %7 = load i8, i8* %arrayidx2, align 1, !dbg !177
  %8 = load i64, i64* %i, align 8, !dbg !180
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %8, !dbg !181
  store i8 %7, i8* %arrayidx3, align 1, !dbg !182
  br label %for.inc, !dbg !183

for.inc:                                          ; preds = %for.body
  %9 = load i64, i64* %i, align 8, !dbg !184
  %inc = add i64 %9, 1, !dbg !184
  store i64 %inc, i64* %i, align 8, !dbg !184
  br label %for.cond, !dbg !185, !llvm.loop !186

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !188
  store i8 0, i8* %arrayidx4, align 1, !dbg !189
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !190
  call void @printLine(i8* %arraydecay5), !dbg !191
  ret void, !dbg !192
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_loop_11_bad", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE127_Buffer_Underread__char_alloca_loop_11.c", directory: "/home/joelyang/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "data", scope: !13, file: !14, line: 25, type: !4)
!18 = !DILocation(line: 25, column: 12, scope: !13)
!19 = !DILocalVariable(name: "dataBuffer", scope: !13, file: !14, line: 26, type: !4)
!20 = !DILocation(line: 26, column: 12, scope: !13)
!21 = !DILocation(line: 26, column: 33, scope: !13)
!22 = !DILocation(line: 27, column: 12, scope: !13)
!23 = !DILocation(line: 27, column: 5, scope: !13)
!24 = !DILocation(line: 28, column: 5, scope: !13)
!25 = !DILocation(line: 28, column: 23, scope: !13)
!26 = !DILocation(line: 29, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !13, file: !14, line: 29, column: 8)
!28 = !DILocation(line: 29, column: 8, scope: !13)
!29 = !DILocation(line: 32, column: 16, scope: !30)
!30 = distinct !DILexicalBlock(scope: !27, file: !14, line: 30, column: 5)
!31 = !DILocation(line: 32, column: 27, scope: !30)
!32 = !DILocation(line: 32, column: 14, scope: !30)
!33 = !DILocation(line: 33, column: 5, scope: !30)
!34 = !DILocalVariable(name: "i", scope: !35, file: !14, line: 35, type: !36)
!35 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 5)
!36 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !37, line: 46, baseType: !38)
!37 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!38 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!39 = !DILocation(line: 35, column: 16, scope: !35)
!40 = !DILocalVariable(name: "dest", scope: !35, file: !14, line: 36, type: !41)
!41 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !42)
!42 = !{!43}
!43 = !DISubrange(count: 100)
!44 = !DILocation(line: 36, column: 14, scope: !35)
!45 = !DILocation(line: 37, column: 9, scope: !35)
!46 = !DILocation(line: 38, column: 9, scope: !35)
!47 = !DILocation(line: 38, column: 21, scope: !35)
!48 = !DILocation(line: 40, column: 16, scope: !49)
!49 = distinct !DILexicalBlock(scope: !35, file: !14, line: 40, column: 9)
!50 = !DILocation(line: 40, column: 14, scope: !49)
!51 = !DILocation(line: 40, column: 21, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !14, line: 40, column: 9)
!53 = !DILocation(line: 40, column: 23, scope: !52)
!54 = !DILocation(line: 40, column: 9, scope: !49)
!55 = !DILocation(line: 42, column: 23, scope: !56)
!56 = distinct !DILexicalBlock(scope: !52, file: !14, line: 41, column: 9)
!57 = !DILocation(line: 42, column: 28, scope: !56)
!58 = !DILocation(line: 42, column: 18, scope: !56)
!59 = !DILocation(line: 42, column: 13, scope: !56)
!60 = !DILocation(line: 42, column: 21, scope: !56)
!61 = !DILocation(line: 43, column: 9, scope: !56)
!62 = !DILocation(line: 40, column: 31, scope: !52)
!63 = !DILocation(line: 40, column: 9, scope: !52)
!64 = distinct !{!64, !54, !65, !66}
!65 = !DILocation(line: 43, column: 9, scope: !49)
!66 = !{!"llvm.loop.mustprogress"}
!67 = !DILocation(line: 45, column: 9, scope: !35)
!68 = !DILocation(line: 45, column: 21, scope: !35)
!69 = !DILocation(line: 46, column: 19, scope: !35)
!70 = !DILocation(line: 46, column: 9, scope: !35)
!71 = !DILocation(line: 48, column: 1, scope: !13)
!72 = distinct !DISubprogram(name: "CWE127_Buffer_Underread__char_alloca_loop_11_good", scope: !14, file: !14, line: 115, type: !15, scopeLine: 116, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!73 = !DILocation(line: 117, column: 5, scope: !72)
!74 = !DILocation(line: 118, column: 5, scope: !72)
!75 = !DILocation(line: 119, column: 1, scope: !72)
!76 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 131, type: !77, scopeLine: 132, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!77 = !DISubroutineType(types: !78)
!78 = !{!79, !79, !80}
!79 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!81 = !DILocalVariable(name: "argc", arg: 1, scope: !76, file: !14, line: 131, type: !79)
!82 = !DILocation(line: 131, column: 14, scope: !76)
!83 = !DILocalVariable(name: "argv", arg: 2, scope: !76, file: !14, line: 131, type: !80)
!84 = !DILocation(line: 131, column: 27, scope: !76)
!85 = !DILocation(line: 134, column: 22, scope: !76)
!86 = !DILocation(line: 134, column: 12, scope: !76)
!87 = !DILocation(line: 134, column: 5, scope: !76)
!88 = !DILocation(line: 136, column: 5, scope: !76)
!89 = !DILocation(line: 137, column: 5, scope: !76)
!90 = !DILocation(line: 138, column: 5, scope: !76)
!91 = !DILocation(line: 141, column: 5, scope: !76)
!92 = !DILocation(line: 142, column: 5, scope: !76)
!93 = !DILocation(line: 143, column: 5, scope: !76)
!94 = !DILocation(line: 145, column: 5, scope: !76)
!95 = distinct !DISubprogram(name: "goodG2B1", scope: !14, file: !14, line: 55, type: !15, scopeLine: 56, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DILocalVariable(name: "data", scope: !95, file: !14, line: 57, type: !4)
!97 = !DILocation(line: 57, column: 12, scope: !95)
!98 = !DILocalVariable(name: "dataBuffer", scope: !95, file: !14, line: 58, type: !4)
!99 = !DILocation(line: 58, column: 12, scope: !95)
!100 = !DILocation(line: 58, column: 33, scope: !95)
!101 = !DILocation(line: 59, column: 12, scope: !95)
!102 = !DILocation(line: 59, column: 5, scope: !95)
!103 = !DILocation(line: 60, column: 5, scope: !95)
!104 = !DILocation(line: 60, column: 23, scope: !95)
!105 = !DILocation(line: 61, column: 8, scope: !106)
!106 = distinct !DILexicalBlock(scope: !95, file: !14, line: 61, column: 8)
!107 = !DILocation(line: 61, column: 8, scope: !95)
!108 = !DILocation(line: 64, column: 9, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !14, line: 62, column: 5)
!110 = !DILocation(line: 65, column: 5, scope: !109)
!111 = !DILocation(line: 69, column: 16, scope: !112)
!112 = distinct !DILexicalBlock(scope: !106, file: !14, line: 67, column: 5)
!113 = !DILocation(line: 69, column: 14, scope: !112)
!114 = !DILocalVariable(name: "i", scope: !115, file: !14, line: 72, type: !36)
!115 = distinct !DILexicalBlock(scope: !95, file: !14, line: 71, column: 5)
!116 = !DILocation(line: 72, column: 16, scope: !115)
!117 = !DILocalVariable(name: "dest", scope: !115, file: !14, line: 73, type: !41)
!118 = !DILocation(line: 73, column: 14, scope: !115)
!119 = !DILocation(line: 74, column: 9, scope: !115)
!120 = !DILocation(line: 75, column: 9, scope: !115)
!121 = !DILocation(line: 75, column: 21, scope: !115)
!122 = !DILocation(line: 77, column: 16, scope: !123)
!123 = distinct !DILexicalBlock(scope: !115, file: !14, line: 77, column: 9)
!124 = !DILocation(line: 77, column: 14, scope: !123)
!125 = !DILocation(line: 77, column: 21, scope: !126)
!126 = distinct !DILexicalBlock(scope: !123, file: !14, line: 77, column: 9)
!127 = !DILocation(line: 77, column: 23, scope: !126)
!128 = !DILocation(line: 77, column: 9, scope: !123)
!129 = !DILocation(line: 79, column: 23, scope: !130)
!130 = distinct !DILexicalBlock(scope: !126, file: !14, line: 78, column: 9)
!131 = !DILocation(line: 79, column: 28, scope: !130)
!132 = !DILocation(line: 79, column: 18, scope: !130)
!133 = !DILocation(line: 79, column: 13, scope: !130)
!134 = !DILocation(line: 79, column: 21, scope: !130)
!135 = !DILocation(line: 80, column: 9, scope: !130)
!136 = !DILocation(line: 77, column: 31, scope: !126)
!137 = !DILocation(line: 77, column: 9, scope: !126)
!138 = distinct !{!138, !128, !139, !66}
!139 = !DILocation(line: 80, column: 9, scope: !123)
!140 = !DILocation(line: 82, column: 9, scope: !115)
!141 = !DILocation(line: 82, column: 21, scope: !115)
!142 = !DILocation(line: 83, column: 19, scope: !115)
!143 = !DILocation(line: 83, column: 9, scope: !115)
!144 = !DILocation(line: 85, column: 1, scope: !95)
!145 = distinct !DISubprogram(name: "goodG2B2", scope: !14, file: !14, line: 88, type: !15, scopeLine: 89, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!146 = !DILocalVariable(name: "data", scope: !145, file: !14, line: 90, type: !4)
!147 = !DILocation(line: 90, column: 12, scope: !145)
!148 = !DILocalVariable(name: "dataBuffer", scope: !145, file: !14, line: 91, type: !4)
!149 = !DILocation(line: 91, column: 12, scope: !145)
!150 = !DILocation(line: 91, column: 33, scope: !145)
!151 = !DILocation(line: 92, column: 12, scope: !145)
!152 = !DILocation(line: 92, column: 5, scope: !145)
!153 = !DILocation(line: 93, column: 5, scope: !145)
!154 = !DILocation(line: 93, column: 23, scope: !145)
!155 = !DILocation(line: 94, column: 8, scope: !156)
!156 = distinct !DILexicalBlock(scope: !145, file: !14, line: 94, column: 8)
!157 = !DILocation(line: 94, column: 8, scope: !145)
!158 = !DILocation(line: 97, column: 16, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !14, line: 95, column: 5)
!160 = !DILocation(line: 97, column: 14, scope: !159)
!161 = !DILocation(line: 98, column: 5, scope: !159)
!162 = !DILocalVariable(name: "i", scope: !163, file: !14, line: 100, type: !36)
!163 = distinct !DILexicalBlock(scope: !145, file: !14, line: 99, column: 5)
!164 = !DILocation(line: 100, column: 16, scope: !163)
!165 = !DILocalVariable(name: "dest", scope: !163, file: !14, line: 101, type: !41)
!166 = !DILocation(line: 101, column: 14, scope: !163)
!167 = !DILocation(line: 102, column: 9, scope: !163)
!168 = !DILocation(line: 103, column: 9, scope: !163)
!169 = !DILocation(line: 103, column: 21, scope: !163)
!170 = !DILocation(line: 105, column: 16, scope: !171)
!171 = distinct !DILexicalBlock(scope: !163, file: !14, line: 105, column: 9)
!172 = !DILocation(line: 105, column: 14, scope: !171)
!173 = !DILocation(line: 105, column: 21, scope: !174)
!174 = distinct !DILexicalBlock(scope: !171, file: !14, line: 105, column: 9)
!175 = !DILocation(line: 105, column: 23, scope: !174)
!176 = !DILocation(line: 105, column: 9, scope: !171)
!177 = !DILocation(line: 107, column: 23, scope: !178)
!178 = distinct !DILexicalBlock(scope: !174, file: !14, line: 106, column: 9)
!179 = !DILocation(line: 107, column: 28, scope: !178)
!180 = !DILocation(line: 107, column: 18, scope: !178)
!181 = !DILocation(line: 107, column: 13, scope: !178)
!182 = !DILocation(line: 107, column: 21, scope: !178)
!183 = !DILocation(line: 108, column: 9, scope: !178)
!184 = !DILocation(line: 105, column: 31, scope: !174)
!185 = !DILocation(line: 105, column: 9, scope: !174)
!186 = distinct !{!186, !176, !187, !66}
!187 = !DILocation(line: 108, column: 9, scope: !171)
!188 = !DILocation(line: 110, column: 9, scope: !163)
!189 = !DILocation(line: 110, column: 21, scope: !163)
!190 = !DILocation(line: 111, column: 19, scope: !163)
!191 = !DILocation(line: 111, column: 9, scope: !163)
!192 = !DILocation(line: 113, column: 1, scope: !145)
