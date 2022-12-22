; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_34.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_34.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.CWE126_Buffer_Overread__char_declare_loop_34_unionType = type { i8* }

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_34_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__char_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data4 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__char_declare_loop_34_unionType* %myUnion, metadata !19, metadata !DIExpression()), !dbg !25
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !26, metadata !DIExpression()), !dbg !30
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !31, metadata !DIExpression()), !dbg !35
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !36
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !36
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !37
  store i8 0, i8* %arrayidx, align 1, !dbg !38
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !39
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !39
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !40
  store i8 0, i8* %arrayidx2, align 1, !dbg !41
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !42
  store i8* %arraydecay3, i8** %data, align 8, !dbg !43
  %0 = load i8*, i8** %data, align 8, !dbg !44
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__char_declare_loop_34_unionType* %myUnion to i8**, !dbg !45
  store i8* %0, i8** %unionFirst, align 8, !dbg !46
  call void @llvm.dbg.declare(metadata i8** %data4, metadata !47, metadata !DIExpression()), !dbg !49
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__char_declare_loop_34_unionType* %myUnion to i8**, !dbg !50
  %1 = load i8*, i8** %unionSecond, align 8, !dbg !50
  store i8* %1, i8** %data4, align 8, !dbg !49
  call void @llvm.dbg.declare(metadata i64* %i, metadata !51, metadata !DIExpression()), !dbg !56
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !57, metadata !DIExpression()), !dbg !58
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !59, metadata !DIExpression()), !dbg !60
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !61
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay5, i8 67, i64 99, i1 false), !dbg !61
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !62
  store i8 0, i8* %arrayidx6, align 1, !dbg !63
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !64
  %call = call i64 @strlen(i8* %arraydecay7) #6, !dbg !65
  store i64 %call, i64* %destLen, align 8, !dbg !66
  store i64 0, i64* %i, align 8, !dbg !67
  br label %for.cond, !dbg !69

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !70
  %3 = load i64, i64* %destLen, align 8, !dbg !72
  %cmp = icmp ult i64 %2, %3, !dbg !73
  br i1 %cmp, label %for.body, label %for.end, !dbg !74

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data4, align 8, !dbg !75
  %5 = load i64, i64* %i, align 8, !dbg !77
  %arrayidx8 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !75
  %6 = load i8, i8* %arrayidx8, align 1, !dbg !75
  %7 = load i64, i64* %i, align 8, !dbg !78
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %7, !dbg !79
  store i8 %6, i8* %arrayidx9, align 1, !dbg !80
  br label %for.inc, !dbg !81

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !82
  %inc = add i64 %8, 1, !dbg !82
  store i64 %inc, i64* %i, align 8, !dbg !82
  br label %for.cond, !dbg !83, !llvm.loop !84

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !87
  store i8 0, i8* %arrayidx10, align 1, !dbg !88
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !89
  call void @printLine(i8* %arraydecay11), !dbg !90
  ret void, !dbg !91
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

declare dso_local void @printLine(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_loop_34_good() #0 !dbg !92 {
entry:
  call void @goodG2B(), !dbg !93
  ret void, !dbg !94
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !95 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !100, metadata !DIExpression()), !dbg !101
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !102, metadata !DIExpression()), !dbg !103
  %call = call i64 @time(i64* null) #7, !dbg !104
  %conv = trunc i64 %call to i32, !dbg !105
  call void @srand(i32 %conv) #7, !dbg !106
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !107
  call void @CWE126_Buffer_Overread__char_declare_loop_34_good(), !dbg !108
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !109
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !110
  call void @CWE126_Buffer_Overread__char_declare_loop_34_bad(), !dbg !111
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !112
  ret i32 0, !dbg !113
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #5

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B() #0 !dbg !114 {
entry:
  %data = alloca i8*, align 8
  %myUnion = alloca %union.CWE126_Buffer_Overread__char_declare_loop_34_unionType, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %data4 = alloca i8*, align 8
  %i = alloca i64, align 8
  %destLen = alloca i64, align 8
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !115, metadata !DIExpression()), !dbg !116
  call void @llvm.dbg.declare(metadata %union.CWE126_Buffer_Overread__char_declare_loop_34_unionType* %myUnion, metadata !117, metadata !DIExpression()), !dbg !118
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !119, metadata !DIExpression()), !dbg !120
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !121, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !123
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !123
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !124
  store i8 0, i8* %arrayidx, align 1, !dbg !125
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !126
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !126
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !127
  store i8 0, i8* %arrayidx2, align 1, !dbg !128
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !129
  store i8* %arraydecay3, i8** %data, align 8, !dbg !130
  %0 = load i8*, i8** %data, align 8, !dbg !131
  %unionFirst = bitcast %union.CWE126_Buffer_Overread__char_declare_loop_34_unionType* %myUnion to i8**, !dbg !132
  store i8* %0, i8** %unionFirst, align 8, !dbg !133
  call void @llvm.dbg.declare(metadata i8** %data4, metadata !134, metadata !DIExpression()), !dbg !136
  %unionSecond = bitcast %union.CWE126_Buffer_Overread__char_declare_loop_34_unionType* %myUnion to i8**, !dbg !137
  %1 = load i8*, i8** %unionSecond, align 8, !dbg !137
  store i8* %1, i8** %data4, align 8, !dbg !136
  call void @llvm.dbg.declare(metadata i64* %i, metadata !138, metadata !DIExpression()), !dbg !140
  call void @llvm.dbg.declare(metadata i64* %destLen, metadata !141, metadata !DIExpression()), !dbg !142
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !143, metadata !DIExpression()), !dbg !144
  %arraydecay5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay5, i8 67, i64 99, i1 false), !dbg !145
  %arrayidx6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !146
  store i8 0, i8* %arrayidx6, align 1, !dbg !147
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !148
  %call = call i64 @strlen(i8* %arraydecay7) #6, !dbg !149
  store i64 %call, i64* %destLen, align 8, !dbg !150
  store i64 0, i64* %i, align 8, !dbg !151
  br label %for.cond, !dbg !153

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i64, i64* %i, align 8, !dbg !154
  %3 = load i64, i64* %destLen, align 8, !dbg !156
  %cmp = icmp ult i64 %2, %3, !dbg !157
  br i1 %cmp, label %for.body, label %for.end, !dbg !158

for.body:                                         ; preds = %for.cond
  %4 = load i8*, i8** %data4, align 8, !dbg !159
  %5 = load i64, i64* %i, align 8, !dbg !161
  %arrayidx8 = getelementptr inbounds i8, i8* %4, i64 %5, !dbg !159
  %6 = load i8, i8* %arrayidx8, align 1, !dbg !159
  %7 = load i64, i64* %i, align 8, !dbg !162
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 %7, !dbg !163
  store i8 %6, i8* %arrayidx9, align 1, !dbg !164
  br label %for.inc, !dbg !165

for.inc:                                          ; preds = %for.body
  %8 = load i64, i64* %i, align 8, !dbg !166
  %inc = add i64 %8, 1, !dbg !166
  store i64 %inc, i64* %i, align 8, !dbg !166
  br label %for.cond, !dbg !167, !llvm.loop !168

for.end:                                          ; preds = %for.cond
  %arrayidx10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !170
  store i8 0, i8* %arrayidx10, align 1, !dbg !171
  %arraydecay11 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !172
  call void @printLine(i8* %arraydecay11), !dbg !173
  ret void, !dbg !174
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_34.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_34_bad", scope: !12, file: !12, line: 29, type: !13, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_loop_34.c", directory: "/root/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 31, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 31, column: 12, scope: !11)
!19 = !DILocalVariable(name: "myUnion", scope: !11, file: !12, line: 32, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "CWE126_Buffer_Overread__char_declare_loop_34_unionType", file: !12, line: 25, baseType: !21)
!21 = distinct !DICompositeType(tag: DW_TAG_union_type, file: !12, line: 21, size: 64, elements: !22)
!22 = !{!23, !24}
!23 = !DIDerivedType(tag: DW_TAG_member, name: "unionFirst", scope: !21, file: !12, line: 23, baseType: !16, size: 64)
!24 = !DIDerivedType(tag: DW_TAG_member, name: "unionSecond", scope: !21, file: !12, line: 24, baseType: !16, size: 64)
!25 = !DILocation(line: 32, column: 60, scope: !11)
!26 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 33, type: !27)
!27 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !28)
!28 = !{!29}
!29 = !DISubrange(count: 50)
!30 = !DILocation(line: 33, column: 10, scope: !11)
!31 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 34, type: !32)
!32 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !33)
!33 = !{!34}
!34 = !DISubrange(count: 100)
!35 = !DILocation(line: 34, column: 10, scope: !11)
!36 = !DILocation(line: 35, column: 5, scope: !11)
!37 = !DILocation(line: 36, column: 5, scope: !11)
!38 = !DILocation(line: 36, column: 25, scope: !11)
!39 = !DILocation(line: 37, column: 5, scope: !11)
!40 = !DILocation(line: 38, column: 5, scope: !11)
!41 = !DILocation(line: 38, column: 27, scope: !11)
!42 = !DILocation(line: 40, column: 12, scope: !11)
!43 = !DILocation(line: 40, column: 10, scope: !11)
!44 = !DILocation(line: 41, column: 26, scope: !11)
!45 = !DILocation(line: 41, column: 13, scope: !11)
!46 = !DILocation(line: 41, column: 24, scope: !11)
!47 = !DILocalVariable(name: "data", scope: !48, file: !12, line: 43, type: !16)
!48 = distinct !DILexicalBlock(scope: !11, file: !12, line: 42, column: 5)
!49 = !DILocation(line: 43, column: 16, scope: !48)
!50 = !DILocation(line: 43, column: 31, scope: !48)
!51 = !DILocalVariable(name: "i", scope: !52, file: !12, line: 45, type: !53)
!52 = distinct !DILexicalBlock(scope: !48, file: !12, line: 44, column: 9)
!53 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !54, line: 46, baseType: !55)
!54 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!55 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!56 = !DILocation(line: 45, column: 20, scope: !52)
!57 = !DILocalVariable(name: "destLen", scope: !52, file: !12, line: 45, type: !53)
!58 = !DILocation(line: 45, column: 23, scope: !52)
!59 = !DILocalVariable(name: "dest", scope: !52, file: !12, line: 46, type: !32)
!60 = !DILocation(line: 46, column: 18, scope: !52)
!61 = !DILocation(line: 47, column: 13, scope: !52)
!62 = !DILocation(line: 48, column: 13, scope: !52)
!63 = !DILocation(line: 48, column: 25, scope: !52)
!64 = !DILocation(line: 49, column: 30, scope: !52)
!65 = !DILocation(line: 49, column: 23, scope: !52)
!66 = !DILocation(line: 49, column: 21, scope: !52)
!67 = !DILocation(line: 52, column: 20, scope: !68)
!68 = distinct !DILexicalBlock(scope: !52, file: !12, line: 52, column: 13)
!69 = !DILocation(line: 52, column: 18, scope: !68)
!70 = !DILocation(line: 52, column: 25, scope: !71)
!71 = distinct !DILexicalBlock(scope: !68, file: !12, line: 52, column: 13)
!72 = !DILocation(line: 52, column: 29, scope: !71)
!73 = !DILocation(line: 52, column: 27, scope: !71)
!74 = !DILocation(line: 52, column: 13, scope: !68)
!75 = !DILocation(line: 54, column: 27, scope: !76)
!76 = distinct !DILexicalBlock(scope: !71, file: !12, line: 53, column: 13)
!77 = !DILocation(line: 54, column: 32, scope: !76)
!78 = !DILocation(line: 54, column: 22, scope: !76)
!79 = !DILocation(line: 54, column: 17, scope: !76)
!80 = !DILocation(line: 54, column: 25, scope: !76)
!81 = !DILocation(line: 55, column: 13, scope: !76)
!82 = !DILocation(line: 52, column: 39, scope: !71)
!83 = !DILocation(line: 52, column: 13, scope: !71)
!84 = distinct !{!84, !74, !85, !86}
!85 = !DILocation(line: 55, column: 13, scope: !68)
!86 = !{!"llvm.loop.mustprogress"}
!87 = !DILocation(line: 56, column: 13, scope: !52)
!88 = !DILocation(line: 56, column: 25, scope: !52)
!89 = !DILocation(line: 57, column: 23, scope: !52)
!90 = !DILocation(line: 57, column: 13, scope: !52)
!91 = !DILocation(line: 60, column: 1, scope: !11)
!92 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_loop_34_good", scope: !12, file: !12, line: 100, type: !13, scopeLine: 101, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocation(line: 102, column: 5, scope: !92)
!94 = !DILocation(line: 103, column: 1, scope: !92)
!95 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 114, type: !96, scopeLine: 115, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!96 = !DISubroutineType(types: !97)
!97 = !{!98, !98, !99}
!98 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!100 = !DILocalVariable(name: "argc", arg: 1, scope: !95, file: !12, line: 114, type: !98)
!101 = !DILocation(line: 114, column: 14, scope: !95)
!102 = !DILocalVariable(name: "argv", arg: 2, scope: !95, file: !12, line: 114, type: !99)
!103 = !DILocation(line: 114, column: 27, scope: !95)
!104 = !DILocation(line: 117, column: 22, scope: !95)
!105 = !DILocation(line: 117, column: 12, scope: !95)
!106 = !DILocation(line: 117, column: 5, scope: !95)
!107 = !DILocation(line: 119, column: 5, scope: !95)
!108 = !DILocation(line: 120, column: 5, scope: !95)
!109 = !DILocation(line: 121, column: 5, scope: !95)
!110 = !DILocation(line: 124, column: 5, scope: !95)
!111 = !DILocation(line: 125, column: 5, scope: !95)
!112 = !DILocation(line: 126, column: 5, scope: !95)
!113 = !DILocation(line: 128, column: 5, scope: !95)
!114 = distinct !DISubprogram(name: "goodG2B", scope: !12, file: !12, line: 67, type: !13, scopeLine: 68, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!115 = !DILocalVariable(name: "data", scope: !114, file: !12, line: 69, type: !16)
!116 = !DILocation(line: 69, column: 12, scope: !114)
!117 = !DILocalVariable(name: "myUnion", scope: !114, file: !12, line: 70, type: !20)
!118 = !DILocation(line: 70, column: 60, scope: !114)
!119 = !DILocalVariable(name: "dataBadBuffer", scope: !114, file: !12, line: 71, type: !27)
!120 = !DILocation(line: 71, column: 10, scope: !114)
!121 = !DILocalVariable(name: "dataGoodBuffer", scope: !114, file: !12, line: 72, type: !32)
!122 = !DILocation(line: 72, column: 10, scope: !114)
!123 = !DILocation(line: 73, column: 5, scope: !114)
!124 = !DILocation(line: 74, column: 5, scope: !114)
!125 = !DILocation(line: 74, column: 25, scope: !114)
!126 = !DILocation(line: 75, column: 5, scope: !114)
!127 = !DILocation(line: 76, column: 5, scope: !114)
!128 = !DILocation(line: 76, column: 27, scope: !114)
!129 = !DILocation(line: 78, column: 12, scope: !114)
!130 = !DILocation(line: 78, column: 10, scope: !114)
!131 = !DILocation(line: 79, column: 26, scope: !114)
!132 = !DILocation(line: 79, column: 13, scope: !114)
!133 = !DILocation(line: 79, column: 24, scope: !114)
!134 = !DILocalVariable(name: "data", scope: !135, file: !12, line: 81, type: !16)
!135 = distinct !DILexicalBlock(scope: !114, file: !12, line: 80, column: 5)
!136 = !DILocation(line: 81, column: 16, scope: !135)
!137 = !DILocation(line: 81, column: 31, scope: !135)
!138 = !DILocalVariable(name: "i", scope: !139, file: !12, line: 83, type: !53)
!139 = distinct !DILexicalBlock(scope: !135, file: !12, line: 82, column: 9)
!140 = !DILocation(line: 83, column: 20, scope: !139)
!141 = !DILocalVariable(name: "destLen", scope: !139, file: !12, line: 83, type: !53)
!142 = !DILocation(line: 83, column: 23, scope: !139)
!143 = !DILocalVariable(name: "dest", scope: !139, file: !12, line: 84, type: !32)
!144 = !DILocation(line: 84, column: 18, scope: !139)
!145 = !DILocation(line: 85, column: 13, scope: !139)
!146 = !DILocation(line: 86, column: 13, scope: !139)
!147 = !DILocation(line: 86, column: 25, scope: !139)
!148 = !DILocation(line: 87, column: 30, scope: !139)
!149 = !DILocation(line: 87, column: 23, scope: !139)
!150 = !DILocation(line: 87, column: 21, scope: !139)
!151 = !DILocation(line: 90, column: 20, scope: !152)
!152 = distinct !DILexicalBlock(scope: !139, file: !12, line: 90, column: 13)
!153 = !DILocation(line: 90, column: 18, scope: !152)
!154 = !DILocation(line: 90, column: 25, scope: !155)
!155 = distinct !DILexicalBlock(scope: !152, file: !12, line: 90, column: 13)
!156 = !DILocation(line: 90, column: 29, scope: !155)
!157 = !DILocation(line: 90, column: 27, scope: !155)
!158 = !DILocation(line: 90, column: 13, scope: !152)
!159 = !DILocation(line: 92, column: 27, scope: !160)
!160 = distinct !DILexicalBlock(scope: !155, file: !12, line: 91, column: 13)
!161 = !DILocation(line: 92, column: 32, scope: !160)
!162 = !DILocation(line: 92, column: 22, scope: !160)
!163 = !DILocation(line: 92, column: 17, scope: !160)
!164 = !DILocation(line: 92, column: 25, scope: !160)
!165 = !DILocation(line: 93, column: 13, scope: !160)
!166 = !DILocation(line: 90, column: 39, scope: !155)
!167 = !DILocation(line: 90, column: 13, scope: !155)
!168 = distinct !{!168, !158, !169, !86}
!169 = !DILocation(line: 93, column: 13, scope: !152)
!170 = !DILocation(line: 94, column: 13, scope: !139)
!171 = !DILocation(line: 94, column: 25, scope: !139)
!172 = !DILocation(line: 95, column: 23, scope: !139)
!173 = !DILocation(line: 95, column: 13, scope: !139)
!174 = !DILocation(line: 98, column: 1, scope: !114)
