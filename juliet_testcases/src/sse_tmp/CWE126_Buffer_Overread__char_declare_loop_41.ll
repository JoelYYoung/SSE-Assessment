; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_41.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_41.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_41_badSink(i8* %data) #0 !dbg !11 {
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
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_41_bad() #0 !dbg !63 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !68, metadata !DIExpression()), !dbg !72
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !73, metadata !DIExpression()), !dbg !74
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !75
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !75
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !76
  store i8 0, i8* %arrayidx, align 1, !dbg !77
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !78
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !78
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !79
  store i8 0, i8* %arrayidx2, align 1, !dbg !80
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !81
  store i8* %arraydecay3, i8** %data, align 8, !dbg !82
  %0 = load i8*, i8** %data, align 8, !dbg !83
  call void @CWE126_Buffer_Overread__char_declare_loop_41_badSink(i8* %0), !dbg !84
  ret void, !dbg !85
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_41_goodG2BSink(i8* %data) #0 !dbg !86 {
entry:
  %data.addr = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  store i8* %data, i8** %data.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %data.addr, metadata !87, metadata !DIExpression()), !dbg !88
  call void @llvm.dbg.declare(metadata i64* %i, metadata !89, metadata !DIExpression()), !dbg !91
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !94, metadata !DIExpression()), !dbg !95
  %arraydecay = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !96
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 67, i64 99, i1 false), !dbg !96
  %arrayidx = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !97
  store i8 0, i8* %arrayidx, align 1, !dbg !98
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !99
  %call = call i64 @strlen(i8* %arraydecay1) #6, !dbg !100
  store i64 %call, i64* %destLen, align 8, !dbg !101
  store i64 0, i64* %i, align 8, !dbg !102
  br label %for.cond, !dbg !104

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, i64* %i, align 8, !dbg !105
  %1 = load i64, i64* %destLen, align 8, !dbg !107
  %cmp = icmp ult i64 %0, %1, !dbg !108
  br i1 %cmp, label %for.body, label %for.end, !dbg !109

for.body:                                         ; preds = %for.cond
  %2 = load i8*, i8** %data.addr, align 8, !dbg !110
  %3 = load i64, i64* %i, align 8, !dbg !112
  %arrayidx2 = getelementptr inbounds i8, i8* %2, i64 %3, !dbg !110
  %4 = load i8, i8* %arrayidx2, align 1, !dbg !110
  %5 = load i64, i64* %i, align 8, !dbg !113
  %arrayidx3 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %5, !dbg !114
  store i8 %4, i8* %arrayidx3, align 1, !dbg !115
  br label %for.inc, !dbg !116

for.inc:                                          ; preds = %for.body
  %6 = load i64, i64* %i, align 8, !dbg !117
  %inc = add i64 %6, 1, !dbg !117
  store i64 %inc, i64* %i, align 8, !dbg !117
  br label %for.cond, !dbg !118, !llvm.loop !119

for.end:                                          ; preds = %for.cond
  %arrayidx4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !121
  store i8 0, i8* %arrayidx4, align 1, !dbg !122
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !123
  call void @printLine(i8* %arraydecay5), !dbg !124
  ret void, !dbg !125
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_41_good() #0 !dbg !126 {
entry:
  call void @goodG2B(), !dbg !127
  ret void, !dbg !128
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !129 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !134, metadata !DIExpression()), !dbg !135
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !136, metadata !DIExpression()), !dbg !137
  %call = call i64 @time(i64* null) #7, !dbg !138
  %conv = trunc i64 %call to i32, !dbg !139
  call void @srand(i32 %conv) #7, !dbg !140
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !141
  call void @CWE126_Buffer_Overread__char_declare_loop_41_good(), !dbg !142
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !143
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !144
  call void @CWE126_Buffer_Overread__char_declare_loop_41_bad(), !dbg !145
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !146
  ret i32 0, !dbg !147
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !148 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !149, metadata !DIExpression()), !dbg !150
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !151, metadata !DIExpression()), !dbg !152
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !153, metadata !DIExpression()), !dbg !154
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !155
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !155
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !156
  store i8 0, i8* %arrayidx, align 1, !dbg !157
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !158
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !158
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !159
  store i8 0, i8* %arrayidx2, align 1, !dbg !160
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !161
  store i8* %arraydecay3, i8** %data, align 8, !dbg !162
  %0 = load i8*, i8** %data, align 8, !dbg !163
  call void @CWE126_Buffer_Overread__char_declare_loop_41_goodG2BSink(i8* %0), !dbg !164
  ret void, !dbg !165
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
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_41.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_41_badSink", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_41.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!16 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!17 = !DILocalVariable(name: "data", arg: 1, scope: !11, file: !12, line: 23, type: !15)
!18 = !DILocation(line: 23, column: 66, scope: !11)
!19 = !DILocalVariable(name: "i", scope: !20, file: !12, line: 26, type: !21)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !22, line: 46, baseType: !23)
!22 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!23 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!24 = !DILocation(line: 26, column: 16, scope: !20)
!25 = !DILocalVariable(name: "destLen", scope: !20, file: !12, line: 26, type: !21)
!26 = !DILocation(line: 26, column: 19, scope: !20)
!27 = !DILocalVariable(name: "dest", scope: !20, file: !12, line: 27, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 800, elements: !29)
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
!39 = distinct !DILexicalBlock(scope: !20, file: !12, line: 33, column: 9)
!40 = !DILocation(line: 33, column: 14, scope: !39)
!41 = !DILocation(line: 33, column: 21, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !12, line: 33, column: 9)
!43 = !DILocation(line: 33, column: 25, scope: !42)
!44 = !DILocation(line: 33, column: 23, scope: !42)
!45 = !DILocation(line: 33, column: 9, scope: !39)
!46 = !DILocation(line: 35, column: 23, scope: !47)
!47 = distinct !DILexicalBlock(scope: !42, file: !12, line: 34, column: 9)
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
!62 = !DILocation(line: 40, column: 1, scope: !11)
!63 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_41_bad", scope: !12, file: !12, line: 42, type: !64, scopeLine: 43, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{null}
!66 = !DILocalVariable(name: "data", scope: !63, file: !12, line: 44, type: !15)
!67 = !DILocation(line: 44, column: 12, scope: !63)
!68 = !DILocalVariable(name: "dataBadBuffer", scope: !63, file: !12, line: 45, type: !69)
!69 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 400, elements: !70)
!70 = !{!71}
!71 = !DISubrange(count: 50)
!72 = !DILocation(line: 45, column: 10, scope: !63)
!73 = !DILocalVariable(name: "dataGoodBuffer", scope: !63, file: !12, line: 46, type: !28)
!74 = !DILocation(line: 46, column: 10, scope: !63)
!75 = !DILocation(line: 47, column: 5, scope: !63)
!76 = !DILocation(line: 48, column: 5, scope: !63)
!77 = !DILocation(line: 48, column: 25, scope: !63)
!78 = !DILocation(line: 49, column: 5, scope: !63)
!79 = !DILocation(line: 50, column: 5, scope: !63)
!80 = !DILocation(line: 50, column: 27, scope: !63)
!81 = !DILocation(line: 52, column: 12, scope: !63)
!82 = !DILocation(line: 52, column: 10, scope: !63)
!83 = !DILocation(line: 53, column: 58, scope: !63)
!84 = !DILocation(line: 53, column: 5, scope: !63)
!85 = !DILocation(line: 54, column: 1, scope: !63)
!86 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_41_goodG2BSink", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!87 = !DILocalVariable(name: "data", arg: 1, scope: !86, file: !12, line: 60, type: !15)
!88 = !DILocation(line: 60, column: 70, scope: !86)
!89 = !DILocalVariable(name: "i", scope: !90, file: !12, line: 63, type: !21)
!90 = distinct !DILexicalBlock(scope: !86, file: !12, line: 62, column: 5)
!91 = !DILocation(line: 63, column: 16, scope: !90)
!92 = !DILocalVariable(name: "destLen", scope: !90, file: !12, line: 63, type: !21)
!93 = !DILocation(line: 63, column: 19, scope: !90)
!94 = !DILocalVariable(name: "dest", scope: !90, file: !12, line: 64, type: !28)
!95 = !DILocation(line: 64, column: 14, scope: !90)
!96 = !DILocation(line: 65, column: 9, scope: !90)
!97 = !DILocation(line: 66, column: 9, scope: !90)
!98 = !DILocation(line: 66, column: 21, scope: !90)
!99 = !DILocation(line: 67, column: 26, scope: !90)
!100 = !DILocation(line: 67, column: 19, scope: !90)
!101 = !DILocation(line: 67, column: 17, scope: !90)
!102 = !DILocation(line: 70, column: 16, scope: !103)
!103 = distinct !DILexicalBlock(scope: !90, file: !12, line: 70, column: 9)
!104 = !DILocation(line: 70, column: 14, scope: !103)
!105 = !DILocation(line: 70, column: 21, scope: !106)
!106 = distinct !DILexicalBlock(scope: !103, file: !12, line: 70, column: 9)
!107 = !DILocation(line: 70, column: 25, scope: !106)
!108 = !DILocation(line: 70, column: 23, scope: !106)
!109 = !DILocation(line: 70, column: 9, scope: !103)
!110 = !DILocation(line: 72, column: 23, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !12, line: 71, column: 9)
!112 = !DILocation(line: 72, column: 28, scope: !111)
!113 = !DILocation(line: 72, column: 18, scope: !111)
!114 = !DILocation(line: 72, column: 13, scope: !111)
!115 = !DILocation(line: 72, column: 21, scope: !111)
!116 = !DILocation(line: 73, column: 9, scope: !111)
!117 = !DILocation(line: 70, column: 35, scope: !106)
!118 = !DILocation(line: 70, column: 9, scope: !106)
!119 = distinct !{!119, !109, !120, !57}
!120 = !DILocation(line: 73, column: 9, scope: !103)
!121 = !DILocation(line: 74, column: 9, scope: !90)
!122 = !DILocation(line: 74, column: 21, scope: !90)
!123 = !DILocation(line: 75, column: 19, scope: !90)
!124 = !DILocation(line: 75, column: 9, scope: !90)
!125 = !DILocation(line: 77, column: 1, scope: !86)
!126 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_41_good", scope: !12, file: !12, line: 94, type: !64, scopeLine: 95, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!127 = !DILocation(line: 96, column: 5, scope: !126)
!128 = !DILocation(line: 97, column: 1, scope: !126)
!129 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 109, type: !130, scopeLine: 110, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!130 = !DISubroutineType(types: !131)
!131 = !{!132, !132, !133}
!132 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!133 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!134 = !DILocalVariable(name: "argc", arg: 1, scope: !129, file: !12, line: 109, type: !132)
!135 = !DILocation(line: 109, column: 14, scope: !129)
!136 = !DILocalVariable(name: "argv", arg: 2, scope: !129, file: !12, line: 109, type: !133)
!137 = !DILocation(line: 109, column: 27, scope: !129)
!138 = !DILocation(line: 112, column: 22, scope: !129)
!139 = !DILocation(line: 112, column: 12, scope: !129)
!140 = !DILocation(line: 112, column: 5, scope: !129)
!141 = !DILocation(line: 114, column: 5, scope: !129)
!142 = !DILocation(line: 115, column: 5, scope: !129)
!143 = !DILocation(line: 116, column: 5, scope: !129)
!144 = !DILocation(line: 119, column: 5, scope: !129)
!145 = !DILocation(line: 120, column: 5, scope: !129)
!146 = !DILocation(line: 121, column: 5, scope: !129)
!147 = !DILocation(line: 123, column: 5, scope: !129)
!148 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 80, type: !64, scopeLine: 81, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!149 = !DILocalVariable(name: "data", scope: !148, file: !12, line: 82, type: !15)
!150 = !DILocation(line: 82, column: 12, scope: !148)
!151 = !DILocalVariable(name: "dataBadBuffer", scope: !148, file: !12, line: 83, type: !69)
!152 = !DILocation(line: 83, column: 10, scope: !148)
!153 = !DILocalVariable(name: "dataGoodBuffer", scope: !148, file: !12, line: 84, type: !28)
!154 = !DILocation(line: 84, column: 10, scope: !148)
!155 = !DILocation(line: 85, column: 5, scope: !148)
!156 = !DILocation(line: 86, column: 5, scope: !148)
!157 = !DILocation(line: 86, column: 25, scope: !148)
!158 = !DILocation(line: 87, column: 5, scope: !148)
!159 = !DILocation(line: 88, column: 5, scope: !148)
!160 = !DILocation(line: 88, column: 27, scope: !148)
!161 = !DILocation(line: 90, column: 12, scope: !148)
!162 = !DILocation(line: 90, column: 10, scope: !148)
!163 = !DILocation(line: 91, column: 62, scope: !148)
!164 = !DILocation(line: 91, column: 5, scope: !148)
!165 = !DILocation(line: 92, column: 1, scope: !148)
