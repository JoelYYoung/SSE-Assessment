; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_41.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_41_badSink(i8* %data) #0 !dbg !13 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i64* %i, metadata !19, metadata !DIExpression()), !dbg !24
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !25, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !32
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !35
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !36
  store i64 %call, i64* %destLen, align 8, !dbg !37
  store i64 0, i64* %i, align 8, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !41
  %1 = load i64, i64* %destLen, align 8, !dbg !43
  %cmp = icmp ult i64 %0, %1, !dbg !44
  br i1 %cmp, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data.addr, align 8, !dbg !46
  %3 = load i64, i64* %i, align 8, !dbg !48
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !46
  %4 = load i8, i8* %arrayidx2, align 1, !dbg !46
  %5 = load i64, i64* %i, align 8, !dbg !49
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !50
  store i8 %4, i8* %arrayidx3, align 1, !dbg !51
  br label %for.inc, !dbg !52

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !53
  %inc = add i64 %6, 1, !dbg !53
  store i64 %inc, i64* %i, align 8, !dbg !53
  br label %for.cond, !dbg !54, !llvm.loop !55

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !58
  store i8 0, i8* %arrayidx4, align 1, !dbg !59
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !60
  call void @printLine(i8* %arraydecay5), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_41_bad() #0 !dbg !63 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !68, metadata !DIExpression()), !dbg !69
  %0 = alloca i8, i64 50, align 16, !dbg !70
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !69
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !71, metadata !DIExpression()), !dbg !72
  %1 = alloca i8, i64 100, align 16, !dbg !73
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !72
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !74
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !75
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !76
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !76
  store i8 0, i8* %arrayidx, align 1, !dbg !77
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !78
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !79
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !80
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !80
  store i8 0, i8* %arrayidx1, align 1, !dbg !81
  %6 = load i8*, i8** %dataBadBuffer, align 8, !dbg !82
  store i8* %6, i8** %data, align 8, !dbg !83
  %7 = load i8*, i8** %data, align 8, !dbg !84
  call void @CWE126_Buffer_Overread__char_alloca_loop_41_badSink(i8* %7), !dbg !85
  ret void, !dbg !86
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_41_goodG2BSink(i8* %data) #0 !dbg !87 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata i64* %i, metadata !90, metadata !DIExpression()), !dbg !92
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !95, metadata !DIExpression()), !dbg !96
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !97
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !97
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !98
  store i8 0, i8* %arrayidx, align 1, !dbg !99
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !100
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !101
  store i64 %call, i64* %destLen, align 8, !dbg !102
  store i64 0, i64* %i, align 8, !dbg !103
  br label %for.cond, !dbg !105

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !106
  %1 = load i64, i64* %destLen, align 8, !dbg !108
  %cmp = icmp ult i64 %0, %1, !dbg !109
  br i1 %cmp, label %for.body, label %for.end, !dbg !110

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data.addr, align 8, !dbg !111
  %3 = load i64, i64* %i, align 8, !dbg !113
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !111
  %4 = load i8, i8* %arrayidx2, align 1, !dbg !111
  %5 = load i64, i64* %i, align 8, !dbg !114
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !115
  store i8 %4, i8* %arrayidx3, align 1, !dbg !116
  br label %for.inc, !dbg !117

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !118
  %inc = add i64 %6, 1, !dbg !118
  store i64 %inc, i64* %i, align 8, !dbg !118
  br label %for.cond, !dbg !119, !llvm.loop !120

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !122
  store i8 0, i8* %arrayidx4, align 1, !dbg !123
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !124
  call void @printLine(i8* %arraydecay5), !dbg !125
  ret void, !dbg !126
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_alloca_loop_41_good() #0 !dbg !127 {
entry:
  call void @goodG2B(), !dbg !128
  ret void, !dbg !129
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !130 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !135, metadata !DIExpression()), !dbg !136
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !137, metadata !DIExpression()), !dbg !138
  %call = call i64 @time(i64* null) #7, !dbg !139
  %conv = trunc i64 %call to i32, !dbg !140
  call void @srand(i32 %conv) #7, !dbg !141
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !142
  call void @CWE126_Buffer_Overread__char_alloca_loop_41_good(), !dbg !143
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !144
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !145
  call void @CWE126_Buffer_Overread__char_alloca_loop_41_bad(), !dbg !146
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !147
  ret i32 0, !dbg !148
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !149 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca i8*, align 8
  %dataGoodBuffer = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata i8** %data, metadata !150, metadata !DIExpression()), !dbg !151
  call void @llvm.dbg.declare(metadata i8** %dataBadBuffer, metadata !152, metadata !DIExpression()), !dbg !153
  %0 = alloca i8, i64 50, align 16, !dbg !154
  store i8* %0, i8** %dataBadBuffer, align 8, !dbg !153
  call void @llvm.dbg.declare(metadata i8** %dataGoodBuffer, metadata !155, metadata !DIExpression()), !dbg !156
  %1 = alloca i8, i64 100, align 16, !dbg !157
  store i8* %1, i8** %dataGoodBuffer, align 8, !dbg !156
  %2 = load i8*, i8** %dataBadBuffer, align 8, !dbg !158
  call void @llvm.memset.p0i8.i64(i8* align 1 %2, i8 65, i64 49, i1 false), !dbg !159
  %3 = load i8*, i8** %dataBadBuffer, align 8, !dbg !160
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 49, !dbg !160
  store i8 0, i8* %arrayidx, align 1, !dbg !161
  %4 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !162
  call void @llvm.memset.p0i8.i64(i8* align 1 %4, i8 65, i64 99, i1 false), !dbg !163
  %5 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !164
  %arrayidx1 = getelementptr inbounds i8, i8* %5, i64 99, !dbg !164
  store i8 0, i8* %arrayidx1, align 1, !dbg !165
  %6 = load i8*, i8** %dataGoodBuffer, align 8, !dbg !166
  store i8* %6, i8** %data, align 8, !dbg !167
  %7 = load i8*, i8** %data, align 8, !dbg !168
  call void @CWE126_Buffer_Overread__char_alloca_loop_41_goodG2BSink(i8* %7), !dbg !169
  ret void, !dbg !170
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readonly willreturn }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_41.c", directory: "/root/SSE-Assessment")
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
!13 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_41_badSink", scope: !14, file: !14, line: 23, type: !15, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_alloca_loop_41.c", directory: "/root/SSE-Assessment")
!15 = !DISubroutineType(types: !16)
!16 = !{null, !4}
!17 = !DILocalVariable(name: "data", arg: 1, scope: !13, file: !14, line: 23, type: !4)
!18 = !DILocation(line: 23, column: 65, scope: !13)
!19 = !DILocalVariable(name: "i", scope: !20, file: !14, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !13, file: !14, line: 25, column: 5)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !22, line: 46, baseType: !23)
!22 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!23 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!24 = !DILocation(line: 26, column: 16, scope: !20)
!25 = !DILocalVariable(name: "destLen", scope: !20, file: !14, line: 26, type: !21)
!26 = !DILocation(line: 26, column: 19, scope: !20)
!27 = !DILocalVariable(name: "dest", scope: !20, file: !14, line: 27, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 27, column: 14, scope: !20)
!32 = !DILocation(line: 28, column: 9, scope: !20)
!33 = !DILocation(line: 29, column: 9, scope: !20)
!34 = !DILocation(line: 29, column: 21, scope: !20)
!35 = !DILocation(line: 30, column: 26, scope: !20)
!36 = !DILocation(line: 30, column: 19, scope: !20)
!37 = !DILocation(line: 30, column: 17, scope: !20)
!38 = !DILocation(line: 33, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !20, file: !14, line: 33, column: 9)
!40 = !DILocation(line: 33, column: 14, scope: !39)
!41 = !DILocation(line: 33, column: 21, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !14, line: 33, column: 9)
!43 = !DILocation(line: 33, column: 25, scope: !42)
!44 = !DILocation(line: 33, column: 23, scope: !42)
!45 = !DILocation(line: 33, column: 9, scope: !39)
!46 = !DILocation(line: 35, column: 23, scope: !47)
!47 = distinct !DILexicalBlock(scope: !42, file: !14, line: 34, column: 9)
!48 = !DILocation(line: 35, column: 28, scope: !47)
!49 = !DILocation(line: 35, column: 18, scope: !47)
!50 = !DILocation(line: 35, column: 13, scope: !47)
!51 = !DILocation(line: 35, column: 21, scope: !47)
!52 = !DILocation(line: 36, column: 9, scope: !47)
!53 = !DILocation(line: 33, column: 35, scope: !42)
!54 = !DILocation(line: 33, column: 9, scope: !42)
!55 = distinct !{!55, !45, !56, !57}
!56 = !DILocation(line: 36, column: 9, scope: !39)
!57 = !{!"llvm.loop.mustprogress"}
!58 = !DILocation(line: 37, column: 9, scope: !20)
!59 = !DILocation(line: 37, column: 21, scope: !20)
!60 = !DILocation(line: 38, column: 19, scope: !20)
!61 = !DILocation(line: 38, column: 9, scope: !20)
!62 = !DILocation(line: 40, column: 1, scope: !13)
!63 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_41_bad", scope: !14, file: !14, line: 42, type: !64, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{null}
!66 = !DILocalVariable(name: "data", scope: !63, file: !14, line: 44, type: !4)
!67 = !DILocation(line: 44, column: 12, scope: !63)
!68 = !DILocalVariable(name: "dataBadBuffer", scope: !63, file: !14, line: 45, type: !4)
!69 = !DILocation(line: 45, column: 12, scope: !63)
!70 = !DILocation(line: 45, column: 36, scope: !63)
!71 = !DILocalVariable(name: "dataGoodBuffer", scope: !63, file: !14, line: 46, type: !4)
!72 = !DILocation(line: 46, column: 12, scope: !63)
!73 = !DILocation(line: 46, column: 37, scope: !63)
!74 = !DILocation(line: 47, column: 12, scope: !63)
!75 = !DILocation(line: 47, column: 5, scope: !63)
!76 = !DILocation(line: 48, column: 5, scope: !63)
!77 = !DILocation(line: 48, column: 25, scope: !63)
!78 = !DILocation(line: 49, column: 12, scope: !63)
!79 = !DILocation(line: 49, column: 5, scope: !63)
!80 = !DILocation(line: 50, column: 5, scope: !63)
!81 = !DILocation(line: 50, column: 27, scope: !63)
!82 = !DILocation(line: 52, column: 12, scope: !63)
!83 = !DILocation(line: 52, column: 10, scope: !63)
!84 = !DILocation(line: 53, column: 57, scope: !63)
!85 = !DILocation(line: 53, column: 5, scope: !63)
!86 = !DILocation(line: 54, column: 1, scope: !63)
!87 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_41_goodG2BSink", scope: !14, file: !14, line: 60, type: !15, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!88 = !DILocalVariable(name: "data", arg: 1, scope: !87, file: !14, line: 60, type: !4)
!89 = !DILocation(line: 60, column: 69, scope: !87)
!90 = !DILocalVariable(name: "i", scope: !91, file: !14, line: 63, type: !21)
!91 = distinct !DILexicalBlock(scope: !87, file: !14, line: 62, column: 5)
!92 = !DILocation(line: 63, column: 16, scope: !91)
!93 = !DILocalVariable(name: "destLen", scope: !91, file: !14, line: 63, type: !21)
!94 = !DILocation(line: 63, column: 19, scope: !91)
!95 = !DILocalVariable(name: "dest", scope: !91, file: !14, line: 64, type: !28)
!96 = !DILocation(line: 64, column: 14, scope: !91)
!97 = !DILocation(line: 65, column: 9, scope: !91)
!98 = !DILocation(line: 66, column: 9, scope: !91)
!99 = !DILocation(line: 66, column: 21, scope: !91)
!100 = !DILocation(line: 67, column: 26, scope: !91)
!101 = !DILocation(line: 67, column: 19, scope: !91)
!102 = !DILocation(line: 67, column: 17, scope: !91)
!103 = !DILocation(line: 70, column: 16, scope: !104)
!104 = distinct !DILexicalBlock(scope: !91, file: !14, line: 70, column: 9)
!105 = !DILocation(line: 70, column: 14, scope: !104)
!106 = !DILocation(line: 70, column: 21, scope: !107)
!107 = distinct !DILexicalBlock(scope: !104, file: !14, line: 70, column: 9)
!108 = !DILocation(line: 70, column: 25, scope: !107)
!109 = !DILocation(line: 70, column: 23, scope: !107)
!110 = !DILocation(line: 70, column: 9, scope: !104)
!111 = !DILocation(line: 72, column: 23, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !14, line: 71, column: 9)
!113 = !DILocation(line: 72, column: 28, scope: !112)
!114 = !DILocation(line: 72, column: 18, scope: !112)
!115 = !DILocation(line: 72, column: 13, scope: !112)
!116 = !DILocation(line: 72, column: 21, scope: !112)
!117 = !DILocation(line: 73, column: 9, scope: !112)
!118 = !DILocation(line: 70, column: 35, scope: !107)
!119 = !DILocation(line: 70, column: 9, scope: !107)
!120 = distinct !{!120, !110, !121, !57}
!121 = !DILocation(line: 73, column: 9, scope: !104)
!122 = !DILocation(line: 74, column: 9, scope: !91)
!123 = !DILocation(line: 74, column: 21, scope: !91)
!124 = !DILocation(line: 75, column: 19, scope: !91)
!125 = !DILocation(line: 75, column: 9, scope: !91)
!126 = !DILocation(line: 77, column: 1, scope: !87)
!127 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_alloca_loop_41_good", scope: !14, file: !14, line: 94, type: !64, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!128 = !DILocation(line: 96, column: 5, scope: !127)
!129 = !DILocation(line: 97, column: 1, scope: !127)
!130 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 109, type: !131, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!131 = !DISubroutineType(types: !132)
!132 = !{!133, !133, !134}
!133 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!135 = !DILocalVariable(name: "argc", arg: 1, scope: !130, file: !14, line: 109, type: !133)
!136 = !DILocation(line: 109, column: 14, scope: !130)
!137 = !DILocalVariable(name: "argv", arg: 2, scope: !130, file: !14, line: 109, type: !134)
!138 = !DILocation(line: 109, column: 27, scope: !130)
!139 = !DILocation(line: 112, column: 22, scope: !130)
!140 = !DILocation(line: 112, column: 12, scope: !130)
!141 = !DILocation(line: 112, column: 5, scope: !130)
!142 = !DILocation(line: 114, column: 5, scope: !130)
!143 = !DILocation(line: 115, column: 5, scope: !130)
!144 = !DILocation(line: 116, column: 5, scope: !130)
!145 = !DILocation(line: 119, column: 5, scope: !130)
!146 = !DILocation(line: 120, column: 5, scope: !130)
!147 = !DILocation(line: 121, column: 5, scope: !130)
!148 = !DILocation(line: 123, column: 5, scope: !130)
!149 = distinct !DISubprogram(name: "goodG2B", scope: !14, file: !14, line: 80, type: !64, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!150 = !DILocalVariable(name: "data", scope: !149, file: !14, line: 82, type: !4)
!151 = !DILocation(line: 82, column: 12, scope: !149)
!152 = !DILocalVariable(name: "dataBadBuffer", scope: !149, file: !14, line: 83, type: !4)
!153 = !DILocation(line: 83, column: 12, scope: !149)
!154 = !DILocation(line: 83, column: 36, scope: !149)
!155 = !DILocalVariable(name: "dataGoodBuffer", scope: !149, file: !14, line: 84, type: !4)
!156 = !DILocation(line: 84, column: 12, scope: !149)
!157 = !DILocation(line: 84, column: 37, scope: !149)
!158 = !DILocation(line: 85, column: 12, scope: !149)
!159 = !DILocation(line: 85, column: 5, scope: !149)
!160 = !DILocation(line: 86, column: 5, scope: !149)
!161 = !DILocation(line: 86, column: 25, scope: !149)
!162 = !DILocation(line: 87, column: 12, scope: !149)
!163 = !DILocation(line: 87, column: 5, scope: !149)
!164 = !DILocation(line: 88, column: 5, scope: !149)
!165 = !DILocation(line: 88, column: 27, scope: !149)
!166 = !DILocation(line: 90, column: 12, scope: !149)
!167 = !DILocation(line: 90, column: 10, scope: !149)
!168 = !DILocation(line: 91, column: 61, scope: !149)
!169 = !DILocation(line: 91, column: 5, scope: !149)
!170 = !DILocation(line: 92, column: 1, scope: !149)
