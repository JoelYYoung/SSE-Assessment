; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_14.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_14.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@globalFive = external dso_local global i32, align 4
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memcpy_14_bad() #0 !dbg !11 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !15, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !29
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !29
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !30
  store i8 0, i8* %arrayidx, align 1, !dbg !31
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !32
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !32
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !33
  store i8 0, i8* %arrayidx2, align 1, !dbg !34
  %0 = load i32, i32* @globalFive, align 4, !dbg !35
  %cmp = icmp eq i32 %0, 5, !dbg !37
  br i1 %cmp, label %if.then, label %if.end, !dbg !38

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !39
  store i8* %arraydecay3, i8** %data, align 8, !dbg !41
  br label %if.end, !dbg !42

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !43, metadata !DIExpression()), !dbg !45
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !46
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !46
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !47
  store i8 0, i8* %arrayidx5, align 1, !dbg !48
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !49
  %1 = load i8*, i8** %data, align 8, !dbg !50
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !51
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !52
  %mul = mul i64 %call, 1, !dbg !53
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %1, i64 %mul, i1 false), !dbg !49
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !54
  store i8 0, i8* %arrayidx8, align 1, !dbg !55
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !56
  call void @printLine(i8* %arraydecay9), !dbg !57
  ret void, !dbg !58
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @strlen(i8*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memcpy_14_good() #0 !dbg !59 {
entry:
  call void @goodG2B1(), !dbg !60
  call void @goodG2B2(), !dbg !61
  ret void, !dbg !62
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !63 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !68, metadata !DIExpression()), !dbg !69
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !70, metadata !DIExpression()), !dbg !71
  %call = call i64 @time(i64* null) #8, !dbg !72
  %conv = trunc i64 %call to i32, !dbg !73
  call void @srand(i32 %conv) #8, !dbg !74
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !75
  call void @CWE126_Buffer_Overread__char_declare_memcpy_14_good(), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !77
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !78
  call void @CWE126_Buffer_Overread__char_declare_memcpy_14_bad(), !dbg !79
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !80
  ret i32 0, !dbg !81
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !82 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !83, metadata !DIExpression()), !dbg !84
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !85, metadata !DIExpression()), !dbg !86
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !87, metadata !DIExpression()), !dbg !88
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !89
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !89
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !90
  store i8 0, i8* %arrayidx, align 1, !dbg !91
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !92
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !93
  store i8 0, i8* %arrayidx2, align 1, !dbg !94
  %0 = load i32, i32* @globalFive, align 4, !dbg !95
  %cmp = icmp ne i32 %0, 5, !dbg !97
  br i1 %cmp, label %if.then, label %if.else, !dbg !98

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !99
  br label %if.end, !dbg !101

if.else:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !102
  store i8* %arraydecay3, i8** %data, align 8, !dbg !104
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !105, metadata !DIExpression()), !dbg !107
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !108
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !108
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !109
  store i8 0, i8* %arrayidx5, align 1, !dbg !110
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !111
  %1 = load i8*, i8** %data, align 8, !dbg !112
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !113
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !114
  %mul = mul i64 %call, 1, !dbg !115
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %1, i64 %mul, i1 false), !dbg !111
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !116
  store i8 0, i8* %arrayidx8, align 1, !dbg !117
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !118
  call void @printLine(i8* %arraydecay9), !dbg !119
  ret void, !dbg !120
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !121 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !122, metadata !DIExpression()), !dbg !123
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !124, metadata !DIExpression()), !dbg !125
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !126, metadata !DIExpression()), !dbg !127
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !128
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !128
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !129
  store i8 0, i8* %arrayidx, align 1, !dbg !130
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !131
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !131
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !132
  store i8 0, i8* %arrayidx2, align 1, !dbg !133
  %0 = load i32, i32* @globalFive, align 4, !dbg !134
  %cmp = icmp eq i32 %0, 5, !dbg !136
  br i1 %cmp, label %if.then, label %if.end, !dbg !137

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !138
  store i8* %arraydecay3, i8** %data, align 8, !dbg !140
  br label %if.end, !dbg !141

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !142, metadata !DIExpression()), !dbg !144
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !145
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !145
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !146
  store i8 0, i8* %arrayidx5, align 1, !dbg !147
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !148
  %1 = load i8*, i8** %data, align 8, !dbg !149
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !150
  %call = call i64 @strlen(i8* %arraydecay7) #7, !dbg !151
  %mul = mul i64 %call, 1, !dbg !152
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %1, i64 %mul, i1 false), !dbg !148
  %arrayidx8 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !153
  store i8 0, i8* %arrayidx8, align 1, !dbg !154
  %arraydecay9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !155
  call void @printLine(i8* %arraydecay9), !dbg !156
  ret void, !dbg !157
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nounwind readonly willreturn }
attributes #8 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_14_bad", scope: !12, file: !12, line: 23, type: !13, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_14.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 25, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 25, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 26, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 26, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 27, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 27, column: 10, scope: !11)
!29 = !DILocation(line: 28, column: 5, scope: !11)
!30 = !DILocation(line: 29, column: 5, scope: !11)
!31 = !DILocation(line: 29, column: 25, scope: !11)
!32 = !DILocation(line: 30, column: 5, scope: !11)
!33 = !DILocation(line: 31, column: 5, scope: !11)
!34 = !DILocation(line: 31, column: 27, scope: !11)
!35 = !DILocation(line: 32, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 32, column: 8)
!37 = !DILocation(line: 32, column: 18, scope: !36)
!38 = !DILocation(line: 32, column: 8, scope: !11)
!39 = !DILocation(line: 35, column: 16, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !12, line: 33, column: 5)
!41 = !DILocation(line: 35, column: 14, scope: !40)
!42 = !DILocation(line: 36, column: 5, scope: !40)
!43 = !DILocalVariable(name: "dest", scope: !44, file: !12, line: 38, type: !25)
!44 = distinct !DILexicalBlock(scope: !11, file: !12, line: 37, column: 5)
!45 = !DILocation(line: 38, column: 14, scope: !44)
!46 = !DILocation(line: 39, column: 9, scope: !44)
!47 = !DILocation(line: 40, column: 9, scope: !44)
!48 = !DILocation(line: 40, column: 21, scope: !44)
!49 = !DILocation(line: 43, column: 9, scope: !44)
!50 = !DILocation(line: 43, column: 22, scope: !44)
!51 = !DILocation(line: 43, column: 35, scope: !44)
!52 = !DILocation(line: 43, column: 28, scope: !44)
!53 = !DILocation(line: 43, column: 40, scope: !44)
!54 = !DILocation(line: 44, column: 9, scope: !44)
!55 = !DILocation(line: 44, column: 21, scope: !44)
!56 = !DILocation(line: 45, column: 19, scope: !44)
!57 = !DILocation(line: 45, column: 9, scope: !44)
!58 = !DILocation(line: 47, column: 1, scope: !11)
!59 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_14_good", scope: !12, file: !12, line: 112, type: !13, scopeLine: 113, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!60 = !DILocation(line: 114, column: 5, scope: !59)
!61 = !DILocation(line: 115, column: 5, scope: !59)
!62 = !DILocation(line: 116, column: 1, scope: !59)
!63 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 128, type: !64, scopeLine: 129, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!64 = !DISubroutineType(types: !65)
!65 = !{!66, !66, !67}
!66 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!68 = !DILocalVariable(name: "argc", arg: 1, scope: !63, file: !12, line: 128, type: !66)
!69 = !DILocation(line: 128, column: 14, scope: !63)
!70 = !DILocalVariable(name: "argv", arg: 2, scope: !63, file: !12, line: 128, type: !67)
!71 = !DILocation(line: 128, column: 27, scope: !63)
!72 = !DILocation(line: 131, column: 22, scope: !63)
!73 = !DILocation(line: 131, column: 12, scope: !63)
!74 = !DILocation(line: 131, column: 5, scope: !63)
!75 = !DILocation(line: 133, column: 5, scope: !63)
!76 = !DILocation(line: 134, column: 5, scope: !63)
!77 = !DILocation(line: 135, column: 5, scope: !63)
!78 = !DILocation(line: 138, column: 5, scope: !63)
!79 = !DILocation(line: 139, column: 5, scope: !63)
!80 = !DILocation(line: 140, column: 5, scope: !63)
!81 = !DILocation(line: 142, column: 5, scope: !63)
!82 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 54, type: !13, scopeLine: 55, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!83 = !DILocalVariable(name: "data", scope: !82, file: !12, line: 56, type: !16)
!84 = !DILocation(line: 56, column: 12, scope: !82)
!85 = !DILocalVariable(name: "dataBadBuffer", scope: !82, file: !12, line: 57, type: !20)
!86 = !DILocation(line: 57, column: 10, scope: !82)
!87 = !DILocalVariable(name: "dataGoodBuffer", scope: !82, file: !12, line: 58, type: !25)
!88 = !DILocation(line: 58, column: 10, scope: !82)
!89 = !DILocation(line: 59, column: 5, scope: !82)
!90 = !DILocation(line: 60, column: 5, scope: !82)
!91 = !DILocation(line: 60, column: 25, scope: !82)
!92 = !DILocation(line: 61, column: 5, scope: !82)
!93 = !DILocation(line: 62, column: 5, scope: !82)
!94 = !DILocation(line: 62, column: 27, scope: !82)
!95 = !DILocation(line: 63, column: 8, scope: !96)
!96 = distinct !DILexicalBlock(scope: !82, file: !12, line: 63, column: 8)
!97 = !DILocation(line: 63, column: 18, scope: !96)
!98 = !DILocation(line: 63, column: 8, scope: !82)
!99 = !DILocation(line: 66, column: 9, scope: !100)
!100 = distinct !DILexicalBlock(scope: !96, file: !12, line: 64, column: 5)
!101 = !DILocation(line: 67, column: 5, scope: !100)
!102 = !DILocation(line: 71, column: 16, scope: !103)
!103 = distinct !DILexicalBlock(scope: !96, file: !12, line: 69, column: 5)
!104 = !DILocation(line: 71, column: 14, scope: !103)
!105 = !DILocalVariable(name: "dest", scope: !106, file: !12, line: 74, type: !25)
!106 = distinct !DILexicalBlock(scope: !82, file: !12, line: 73, column: 5)
!107 = !DILocation(line: 74, column: 14, scope: !106)
!108 = !DILocation(line: 75, column: 9, scope: !106)
!109 = !DILocation(line: 76, column: 9, scope: !106)
!110 = !DILocation(line: 76, column: 21, scope: !106)
!111 = !DILocation(line: 79, column: 9, scope: !106)
!112 = !DILocation(line: 79, column: 22, scope: !106)
!113 = !DILocation(line: 79, column: 35, scope: !106)
!114 = !DILocation(line: 79, column: 28, scope: !106)
!115 = !DILocation(line: 79, column: 40, scope: !106)
!116 = !DILocation(line: 80, column: 9, scope: !106)
!117 = !DILocation(line: 80, column: 21, scope: !106)
!118 = !DILocation(line: 81, column: 19, scope: !106)
!119 = !DILocation(line: 81, column: 9, scope: !106)
!120 = !DILocation(line: 83, column: 1, scope: !82)
!121 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 86, type: !13, scopeLine: 87, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!122 = !DILocalVariable(name: "data", scope: !121, file: !12, line: 88, type: !16)
!123 = !DILocation(line: 88, column: 12, scope: !121)
!124 = !DILocalVariable(name: "dataBadBuffer", scope: !121, file: !12, line: 89, type: !20)
!125 = !DILocation(line: 89, column: 10, scope: !121)
!126 = !DILocalVariable(name: "dataGoodBuffer", scope: !121, file: !12, line: 90, type: !25)
!127 = !DILocation(line: 90, column: 10, scope: !121)
!128 = !DILocation(line: 91, column: 5, scope: !121)
!129 = !DILocation(line: 92, column: 5, scope: !121)
!130 = !DILocation(line: 92, column: 25, scope: !121)
!131 = !DILocation(line: 93, column: 5, scope: !121)
!132 = !DILocation(line: 94, column: 5, scope: !121)
!133 = !DILocation(line: 94, column: 27, scope: !121)
!134 = !DILocation(line: 95, column: 8, scope: !135)
!135 = distinct !DILexicalBlock(scope: !121, file: !12, line: 95, column: 8)
!136 = !DILocation(line: 95, column: 18, scope: !135)
!137 = !DILocation(line: 95, column: 8, scope: !121)
!138 = !DILocation(line: 98, column: 16, scope: !139)
!139 = distinct !DILexicalBlock(scope: !135, file: !12, line: 96, column: 5)
!140 = !DILocation(line: 98, column: 14, scope: !139)
!141 = !DILocation(line: 99, column: 5, scope: !139)
!142 = !DILocalVariable(name: "dest", scope: !143, file: !12, line: 101, type: !25)
!143 = distinct !DILexicalBlock(scope: !121, file: !12, line: 100, column: 5)
!144 = !DILocation(line: 101, column: 14, scope: !143)
!145 = !DILocation(line: 102, column: 9, scope: !143)
!146 = !DILocation(line: 103, column: 9, scope: !143)
!147 = !DILocation(line: 103, column: 21, scope: !143)
!148 = !DILocation(line: 106, column: 9, scope: !143)
!149 = !DILocation(line: 106, column: 22, scope: !143)
!150 = !DILocation(line: 106, column: 35, scope: !143)
!151 = !DILocation(line: 106, column: 28, scope: !143)
!152 = !DILocation(line: 106, column: 40, scope: !143)
!153 = !DILocation(line: 107, column: 9, scope: !143)
!154 = !DILocation(line: 107, column: 21, scope: !143)
!155 = !DILocation(line: 108, column: 19, scope: !143)
!156 = !DILocation(line: 108, column: 9, scope: !143)
!157 = !DILocation(line: 110, column: 1, scope: !121)
