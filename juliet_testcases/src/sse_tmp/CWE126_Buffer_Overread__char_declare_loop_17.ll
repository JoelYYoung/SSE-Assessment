; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_17.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_17.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_17_bad() #0 !dbg !11 {
entry:
  %i = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i4 = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %i, metadata !15, metadata !DIExpression()), !dbg !17
  call void @llvm.dbg.declare(metadata i8** %data, metadata !18, metadata !DIExpression()), !dbg !21
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !22, metadata !DIExpression()), !dbg !26
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !27, metadata !DIExpression()), !dbg !31
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !32
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !33
  store i8 0, i8* %arrayidx, align 1, !dbg !34
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !35
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !35
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !36
  store i8 0, i8* %arrayidx2, align 1, !dbg !37
  store i32 0, i32* %i, align 4, !dbg !38
  br label %for.cond, !dbg !40

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !41
  %cmp = icmp slt i32 %0, 1, !dbg !43
  br i1 %cmp, label %for.body, label %for.end, !dbg !44

for.body:                                         ; preds = %for.cond
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !45
  store i8* %arraydecay3, i8** %data, align 8, !dbg !47
  br label %for.inc, !dbg !48

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %i, align 4, !dbg !49
  %inc = add nsw i32 %1, 1, !dbg !49
  store i32 %inc, i32* %i, align 4, !dbg !49
  br label %for.cond, !dbg !50, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i4, metadata !54, metadata !DIExpression()), !dbg !59
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !60, metadata !DIExpression()), !dbg !61
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !62, metadata !DIExpression()), !dbg !63
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !64
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay5, i8 67, i64 99, i1 false), !dbg !64
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !65
  store i8 0, i8* %arrayidx6, align 1, !dbg !66
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !67
  %call = call i64 @strlen(i8* %arraydecay7) #6, !dbg !68
  store i64 %call, i64* %destLen, align 8, !dbg !69
  store i64 0, i64* %i4, align 8, !dbg !70
  br label %for.cond8, !dbg !72

for.cond8:                                        ; preds = %for.inc13, %for.end
  %2 = load i64, i64* %i4, align 8, !dbg !73
  %3 = load i64, i64* %destLen, align 8, !dbg !75
  %cmp9 = icmp ult i64 %2, %3, !dbg !76
  br i1 %cmp9, label %for.body10, label %for.end15, !dbg !77

for.body10:                                       ; preds = %for.cond8
  %4 = load i8*, i8** %data, align 8, !dbg !78
  %5 = load i64, i64* %i4, align 8, !dbg !80
  %arrayidx11 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !78
  %6 = load i8, i8* %arrayidx11, align 1, !dbg !78
  %7 = load i64, i64* %i4, align 8, !dbg !81
  %arrayidx12 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %7, !dbg !82
  store i8 %6, i8* %arrayidx12, align 1, !dbg !83
  br label %for.inc13, !dbg !84

for.inc13:                                        ; preds = %for.body10
  %8 = load i64, i64* %i4, align 8, !dbg !85
  %inc14 = add i64 %8, 1, !dbg !85
  store i64 %inc14, i64* %i4, align 8, !dbg !85
  br label %for.cond8, !dbg !86, !llvm.loop !87

for.end15:                                        ; preds = %for.cond8
  %arrayidx16 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !89
  store i8 0, i8* %arrayidx16, align 1, !dbg !90
  %arraydecay17 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !91
  call void @printLine(i8* %arraydecay17), !dbg !92
  ret void, !dbg !93
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_17_good() #0 !dbg !94 {
entry:
  call void @goodG2B(), !dbg !95
  ret void, !dbg !96
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !97 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !101, metadata !DIExpression()), !dbg !102
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !103, metadata !DIExpression()), !dbg !104
  %call = call i64 @time(i64* null) #7, !dbg !105
  %conv = trunc i64 %call to i32, !dbg !106
  call void @srand(i32 %conv) #7, !dbg !107
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !108
  call void @CWE126_Buffer_Overread__char_declare_loop_17_good(), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !110
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !111
  call void @CWE126_Buffer_Overread__char_declare_loop_17_bad(), !dbg !112
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !113
  ret i32 0, !dbg !114
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !115 {
entry:
  %h = alloca i32, align 4
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i32* %h, metadata !116, metadata !DIExpression()), !dbg !117
  call void @llvm.dbg.declare(metadata i8** %data, metadata !118, metadata !DIExpression()), !dbg !119
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !122, metadata !DIExpression()), !dbg !123
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !124
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !124
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !125
  store i8 0, i8* %arrayidx, align 1, !dbg !126
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !127
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !127
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !128
  store i8 0, i8* %arrayidx2, align 1, !dbg !129
  store i32 0, i32* %h, align 4, !dbg !130
  br label %for.cond, !dbg !132

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %h, align 4, !dbg !133
  %cmp = icmp slt i32 %0, 1, !dbg !135
  br i1 %cmp, label %for.body, label %for.end, !dbg !136

for.body:                                         ; preds = %for.cond
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !137
  store i8* %arraydecay3, i8** %data, align 8, !dbg !139
  br label %for.inc, !dbg !140

for.inc:                                          ; preds = %for.body
  %1 = load i32, i32* %h, align 4, !dbg !141
  %inc = add nsw i32 %1, 1, !dbg !141
  store i32 %inc, i32* %h, align 4, !dbg !141
  br label %for.cond, !dbg !142, !llvm.loop !143

for.end:                                          ; preds = %for.cond
  call void @llvm.dbg.declare(metadata i64* %i, metadata !145, metadata !DIExpression()), !dbg !147
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !148, metadata !DIExpression()), !dbg !149
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !150, metadata !DIExpression()), !dbg !151
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !152
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !152
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !153
  store i8 0, i8* %arrayidx5, align 1, !dbg !154
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !155
  %call = call i64 @strlen(i8* %arraydecay6) #6, !dbg !156
  store i64 %call, i64* %destLen, align 8, !dbg !157
  store i64 0, i64* %i, align 8, !dbg !158
  br label %for.cond7, !dbg !160

for.cond7:                                        ; preds = %for.inc12, %for.end
  %2 = load i64, i64* %i, align 8, !dbg !161
  %3 = load i64, i64* %destLen, align 8, !dbg !163
  %cmp8 = icmp ult i64 %2, %3, !dbg !164
  br i1 %cmp8, label %for.body9, label %for.end14, !dbg !165

for.body9:                                        ; preds = %for.cond7
  %4 = load i8*, i8** %data, align 8, !dbg !166
  %5 = load i64, i64* %i, align 8, !dbg !168
  %arrayidx10 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !166
  %6 = load i8, i8* %arrayidx10, align 1, !dbg !166
  %7 = load i64, i64* %i, align 8, !dbg !169
  %arrayidx11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %7, !dbg !170
  store i8 %6, i8* %arrayidx11, align 1, !dbg !171
  br label %for.inc12, !dbg !172

for.inc12:                                        ; preds = %for.body9
  %8 = load i64, i64* %i, align 8, !dbg !173
  %inc13 = add i64 %8, 1, !dbg !173
  store i64 %inc13, i64* %i, align 8, !dbg !173
  br label %for.cond7, !dbg !174, !llvm.loop !175

for.end14:                                        ; preds = %for.cond7
  %arrayidx15 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !177
  store i8 0, i8* %arrayidx15, align 1, !dbg !178
  %arraydecay16 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !179
  call void @printLine(i8* %arraydecay16), !dbg !180
  ret void, !dbg !181
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_17.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_17_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_17.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!17 = !DILocation(line: 25, column: 9, scope: !11)
!18 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 26, type: !19)
!19 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !20, size: 64)
!20 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!21 = !DILocation(line: 26, column: 12, scope: !11)
!22 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 27, type: !23)
!23 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 400, elements: !24)
!24 = !{!25}
!25 = !DISubrange(count: 50)
!26 = !DILocation(line: 27, column: 10, scope: !11)
!27 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 28, type: !28)
!28 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 800, elements: !29)
!29 = !{!30}
!30 = !DISubrange(count: 100)
!31 = !DILocation(line: 28, column: 10, scope: !11)
!32 = !DILocation(line: 29, column: 5, scope: !11)
!33 = !DILocation(line: 30, column: 5, scope: !11)
!34 = !DILocation(line: 30, column: 25, scope: !11)
!35 = !DILocation(line: 31, column: 5, scope: !11)
!36 = !DILocation(line: 32, column: 5, scope: !11)
!37 = !DILocation(line: 32, column: 27, scope: !11)
!38 = !DILocation(line: 33, column: 11, scope: !39)
!39 = distinct !DILexicalBlock(scope: !11, file: !12, line: 33, column: 5)
!40 = !DILocation(line: 33, column: 9, scope: !39)
!41 = !DILocation(line: 33, column: 16, scope: !42)
!42 = distinct !DILexicalBlock(scope: !39, file: !12, line: 33, column: 5)
!43 = !DILocation(line: 33, column: 18, scope: !42)
!44 = !DILocation(line: 33, column: 5, scope: !39)
!45 = !DILocation(line: 36, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !12, line: 34, column: 5)
!47 = !DILocation(line: 36, column: 14, scope: !46)
!48 = !DILocation(line: 37, column: 5, scope: !46)
!49 = !DILocation(line: 33, column: 24, scope: !42)
!50 = !DILocation(line: 33, column: 5, scope: !42)
!51 = distinct !{!51, !44, !52, !53}
!52 = !DILocation(line: 37, column: 5, scope: !39)
!53 = !{!"llvm.loop.mustprogress"}
!54 = !DILocalVariable(name: "i", scope: !55, file: !12, line: 39, type: !56)
!55 = distinct !DILexicalBlock(scope: !11, file: !12, line: 38, column: 5)
!56 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !57, line: 46, baseType: !58)
!57 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!58 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!59 = !DILocation(line: 39, column: 16, scope: !55)
!60 = !DILocalVariable(name: "destLen", scope: !55, file: !12, line: 39, type: !56)
!61 = !DILocation(line: 39, column: 19, scope: !55)
!62 = !DILocalVariable(name: "dest", scope: !55, file: !12, line: 40, type: !28)
!63 = !DILocation(line: 40, column: 14, scope: !55)
!64 = !DILocation(line: 41, column: 9, scope: !55)
!65 = !DILocation(line: 42, column: 9, scope: !55)
!66 = !DILocation(line: 42, column: 21, scope: !55)
!67 = !DILocation(line: 43, column: 26, scope: !55)
!68 = !DILocation(line: 43, column: 19, scope: !55)
!69 = !DILocation(line: 43, column: 17, scope: !55)
!70 = !DILocation(line: 46, column: 16, scope: !71)
!71 = distinct !DILexicalBlock(scope: !55, file: !12, line: 46, column: 9)
!72 = !DILocation(line: 46, column: 14, scope: !71)
!73 = !DILocation(line: 46, column: 21, scope: !74)
!74 = distinct !DILexicalBlock(scope: !71, file: !12, line: 46, column: 9)
!75 = !DILocation(line: 46, column: 25, scope: !74)
!76 = !DILocation(line: 46, column: 23, scope: !74)
!77 = !DILocation(line: 46, column: 9, scope: !71)
!78 = !DILocation(line: 48, column: 23, scope: !79)
!79 = distinct !DILexicalBlock(scope: !74, file: !12, line: 47, column: 9)
!80 = !DILocation(line: 48, column: 28, scope: !79)
!81 = !DILocation(line: 48, column: 18, scope: !79)
!82 = !DILocation(line: 48, column: 13, scope: !79)
!83 = !DILocation(line: 48, column: 21, scope: !79)
!84 = !DILocation(line: 49, column: 9, scope: !79)
!85 = !DILocation(line: 46, column: 35, scope: !74)
!86 = !DILocation(line: 46, column: 9, scope: !74)
!87 = distinct !{!87, !77, !88, !53}
!88 = !DILocation(line: 49, column: 9, scope: !71)
!89 = !DILocation(line: 50, column: 9, scope: !55)
!90 = !DILocation(line: 50, column: 21, scope: !55)
!91 = !DILocation(line: 51, column: 19, scope: !55)
!92 = !DILocation(line: 51, column: 9, scope: !55)
!93 = !DILocation(line: 53, column: 1, scope: !11)
!94 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_17_good", scope: !12, file: !12, line: 92, type: !13, scopeLine: 93, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!95 = !DILocation(line: 94, column: 5, scope: !94)
!96 = !DILocation(line: 95, column: 1, scope: !94)
!97 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 107, type: !98, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!98 = !DISubroutineType(types: !99)
!99 = !{!16, !16, !100}
!100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !19, size: 64)
!101 = !DILocalVariable(name: "argc", arg: 1, scope: !97, file: !12, line: 107, type: !16)
!102 = !DILocation(line: 107, column: 14, scope: !97)
!103 = !DILocalVariable(name: "argv", arg: 2, scope: !97, file: !12, line: 107, type: !100)
!104 = !DILocation(line: 107, column: 27, scope: !97)
!105 = !DILocation(line: 110, column: 22, scope: !97)
!106 = !DILocation(line: 110, column: 12, scope: !97)
!107 = !DILocation(line: 110, column: 5, scope: !97)
!108 = !DILocation(line: 112, column: 5, scope: !97)
!109 = !DILocation(line: 113, column: 5, scope: !97)
!110 = !DILocation(line: 114, column: 5, scope: !97)
!111 = !DILocation(line: 117, column: 5, scope: !97)
!112 = !DILocation(line: 118, column: 5, scope: !97)
!113 = !DILocation(line: 119, column: 5, scope: !97)
!114 = !DILocation(line: 121, column: 5, scope: !97)
!115 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 60, type: !13, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!116 = !DILocalVariable(name: "h", scope: !115, file: !12, line: 62, type: !16)
!117 = !DILocation(line: 62, column: 9, scope: !115)
!118 = !DILocalVariable(name: "data", scope: !115, file: !12, line: 63, type: !19)
!119 = !DILocation(line: 63, column: 12, scope: !115)
!120 = !DILocalVariable(name: "dataBadBuffer", scope: !115, file: !12, line: 64, type: !23)
!121 = !DILocation(line: 64, column: 10, scope: !115)
!122 = !DILocalVariable(name: "dataGoodBuffer", scope: !115, file: !12, line: 65, type: !28)
!123 = !DILocation(line: 65, column: 10, scope: !115)
!124 = !DILocation(line: 66, column: 5, scope: !115)
!125 = !DILocation(line: 67, column: 5, scope: !115)
!126 = !DILocation(line: 67, column: 25, scope: !115)
!127 = !DILocation(line: 68, column: 5, scope: !115)
!128 = !DILocation(line: 69, column: 5, scope: !115)
!129 = !DILocation(line: 69, column: 27, scope: !115)
!130 = !DILocation(line: 70, column: 11, scope: !131)
!131 = distinct !DILexicalBlock(scope: !115, file: !12, line: 70, column: 5)
!132 = !DILocation(line: 70, column: 9, scope: !131)
!133 = !DILocation(line: 70, column: 16, scope: !134)
!134 = distinct !DILexicalBlock(scope: !131, file: !12, line: 70, column: 5)
!135 = !DILocation(line: 70, column: 18, scope: !134)
!136 = !DILocation(line: 70, column: 5, scope: !131)
!137 = !DILocation(line: 73, column: 16, scope: !138)
!138 = distinct !DILexicalBlock(scope: !134, file: !12, line: 71, column: 5)
!139 = !DILocation(line: 73, column: 14, scope: !138)
!140 = !DILocation(line: 74, column: 5, scope: !138)
!141 = !DILocation(line: 70, column: 24, scope: !134)
!142 = !DILocation(line: 70, column: 5, scope: !134)
!143 = distinct !{!143, !136, !144, !53}
!144 = !DILocation(line: 74, column: 5, scope: !131)
!145 = !DILocalVariable(name: "i", scope: !146, file: !12, line: 76, type: !56)
!146 = distinct !DILexicalBlock(scope: !115, file: !12, line: 75, column: 5)
!147 = !DILocation(line: 76, column: 16, scope: !146)
!148 = !DILocalVariable(name: "destLen", scope: !146, file: !12, line: 76, type: !56)
!149 = !DILocation(line: 76, column: 19, scope: !146)
!150 = !DILocalVariable(name: "dest", scope: !146, file: !12, line: 77, type: !28)
!151 = !DILocation(line: 77, column: 14, scope: !146)
!152 = !DILocation(line: 78, column: 9, scope: !146)
!153 = !DILocation(line: 79, column: 9, scope: !146)
!154 = !DILocation(line: 79, column: 21, scope: !146)
!155 = !DILocation(line: 80, column: 26, scope: !146)
!156 = !DILocation(line: 80, column: 19, scope: !146)
!157 = !DILocation(line: 80, column: 17, scope: !146)
!158 = !DILocation(line: 83, column: 16, scope: !159)
!159 = distinct !DILexicalBlock(scope: !146, file: !12, line: 83, column: 9)
!160 = !DILocation(line: 83, column: 14, scope: !159)
!161 = !DILocation(line: 83, column: 21, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !12, line: 83, column: 9)
!163 = !DILocation(line: 83, column: 25, scope: !162)
!164 = !DILocation(line: 83, column: 23, scope: !162)
!165 = !DILocation(line: 83, column: 9, scope: !159)
!166 = !DILocation(line: 85, column: 23, scope: !167)
!167 = distinct !DILexicalBlock(scope: !162, file: !12, line: 84, column: 9)
!168 = !DILocation(line: 85, column: 28, scope: !167)
!169 = !DILocation(line: 85, column: 18, scope: !167)
!170 = !DILocation(line: 85, column: 13, scope: !167)
!171 = !DILocation(line: 85, column: 21, scope: !167)
!172 = !DILocation(line: 86, column: 9, scope: !167)
!173 = !DILocation(line: 83, column: 35, scope: !162)
!174 = !DILocation(line: 83, column: 9, scope: !162)
!175 = distinct !{!175, !165, !176, !53}
!176 = !DILocation(line: 86, column: 9, scope: !159)
!177 = !DILocation(line: 87, column: 9, scope: !146)
!178 = !DILocation(line: 87, column: 21, scope: !146)
!179 = !DILocation(line: 88, column: 19, scope: !146)
!180 = !DILocation(line: 88, column: 9, scope: !146)
!181 = !DILocation(line: 90, column: 1, scope: !115)
