; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__char_declare_memcpy_08_bad() #0 !dbg !11 {
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
  %call = call i32 @staticReturnsTrue(), !dbg !35
  %tobool = icmp ne i32 %call, 0, !dbg !35
  br i1 %tobool, label %if.then, label %if.end, !dbg !37

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !38
  store i8* %arraydecay3, i8** %data, align 8, !dbg !40
  br label %if.end, !dbg !41

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !42, metadata !DIExpression()), !dbg !44
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !45
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !45
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !46
  store i8 0, i8* %arrayidx5, align 1, !dbg !47
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !48
  %0 = load i8*, i8** %data, align 8, !dbg !49
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !50
  %call8 = call i64 @strlen(i8* %arraydecay7) #7, !dbg !51
  %mul = mul i64 %call8, 1, !dbg !52
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %0, i64 %mul, i1 false), !dbg !48
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !53
  store i8 0, i8* %arrayidx9, align 1, !dbg !54
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !55
  call void @printLine(i8* %arraydecay10), !dbg !56
  ret void, !dbg !57
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
define dso_local void @CWE126_Buffer_Overread__char_declare_memcpy_08_good() #0 !dbg !58 {
entry:
  call void @goodG2B1(), !dbg !59
  call void @goodG2B2(), !dbg !60
  ret void, !dbg !61
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !62 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !67, metadata !DIExpression()), !dbg !68
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !69, metadata !DIExpression()), !dbg !70
  %call = call i64 @time(i64* null) #8, !dbg !71
  %conv = trunc i64 %call to i32, !dbg !72
  call void @srand(i32 %conv) #8, !dbg !73
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !74
  call void @CWE126_Buffer_Overread__char_declare_memcpy_08_good(), !dbg !75
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !76
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !77
  call void @CWE126_Buffer_Overread__char_declare_memcpy_08_bad(), !dbg !78
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !79
  ret i32 0, !dbg !80
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #6

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #6

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !81 {
entry:
  ret i32 1, !dbg !84
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !85 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !86, metadata !DIExpression()), !dbg !87
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !88, metadata !DIExpression()), !dbg !89
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !90, metadata !DIExpression()), !dbg !91
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !92
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !92
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !93
  store i8 0, i8* %arrayidx, align 1, !dbg !94
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !95
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !95
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !96
  store i8 0, i8* %arrayidx2, align 1, !dbg !97
  %call = call i32 @staticReturnsFalse(), !dbg !98
  %tobool = icmp ne i32 %call, 0, !dbg !98
  br i1 %tobool, label %if.then, label %if.else, !dbg !100

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !101
  br label %if.end, !dbg !103

if.else:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !104
  store i8* %arraydecay3, i8** %data, align 8, !dbg !106
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !107, metadata !DIExpression()), !dbg !109
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !110
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !110
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !111
  store i8 0, i8* %arrayidx5, align 1, !dbg !112
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !113
  %0 = load i8*, i8** %data, align 8, !dbg !114
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !115
  %call8 = call i64 @strlen(i8* %arraydecay7) #7, !dbg !116
  %mul = mul i64 %call8, 1, !dbg !117
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %0, i64 %mul, i1 false), !dbg !113
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !118
  store i8 0, i8* %arrayidx9, align 1, !dbg !119
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !120
  call void @printLine(i8* %arraydecay10), !dbg !121
  ret void, !dbg !122
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !123 {
entry:
  ret i32 0, !dbg !124
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !125 {
entry:
  %data = alloca i8*, align 8
  %dataBadBuffer = alloca [50 x i8], align 16
  %dataGoodBuffer = alloca [100 x i8], align 16
  %dest = alloca [100 x i8], align 16
  call void @llvm.dbg.declare(metadata i8** %data, metadata !126, metadata !DIExpression()), !dbg !127
  call void @llvm.dbg.declare(metadata [50 x i8]* %dataBadBuffer, metadata !128, metadata !DIExpression()), !dbg !129
  call void @llvm.dbg.declare(metadata [100 x i8]* %dataGoodBuffer, metadata !130, metadata !DIExpression()), !dbg !131
  %arraydecay = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 0, !dbg !132
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay, i8 65, i64 49, i1 false), !dbg !132
  %arrayidx = getelementptr inbounds [50 x i8], [50 x i8]* %dataBadBuffer, i64 0, i64 49, !dbg !133
  store i8 0, i8* %arrayidx, align 1, !dbg !134
  %arraydecay1 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !135
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay1, i8 65, i64 99, i1 false), !dbg !135
  %arrayidx2 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 99, !dbg !136
  store i8 0, i8* %arrayidx2, align 1, !dbg !137
  %call = call i32 @staticReturnsTrue(), !dbg !138
  %tobool = icmp ne i32 %call, 0, !dbg !138
  br i1 %tobool, label %if.then, label %if.end, !dbg !140

if.then:                                          ; preds = %entry
  %arraydecay3 = getelementptr inbounds [100 x i8], [100 x i8]* %dataGoodBuffer, i64 0, i64 0, !dbg !141
  store i8* %arraydecay3, i8** %data, align 8, !dbg !143
  br label %if.end, !dbg !144

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i8]* %dest, metadata !145, metadata !DIExpression()), !dbg !147
  %arraydecay4 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !148
  call void @llvm.memset.p0i8.i64(i8* align 16 %arraydecay4, i8 67, i64 99, i1 false), !dbg !148
  %arrayidx5 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !149
  store i8 0, i8* %arrayidx5, align 1, !dbg !150
  %arraydecay6 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !151
  %0 = load i8*, i8** %data, align 8, !dbg !152
  %arraydecay7 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !153
  %call8 = call i64 @strlen(i8* %arraydecay7) #7, !dbg !154
  %mul = mul i64 %call8, 1, !dbg !155
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %arraydecay6, i8* align 1 %0, i64 %mul, i1 false), !dbg !151
  %arrayidx9 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 99, !dbg !156
  store i8 0, i8* %arrayidx9, align 1, !dbg !157
  %arraydecay10 = getelementptr inbounds [100 x i8], [100 x i8]* %dest, i64 0, i64 0, !dbg !158
  call void @printLine(i8* %arraydecay10), !dbg !159
  ret void, !dbg !160
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
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!2 = !{}
!3 = !{!4}
!4 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"clang version 13.0.0"}
!11 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_08_bad", scope: !12, file: !12, line: 37, type: !13, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!12 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__char_declare_memcpy_08.c", directory: "/home/joelyang/SSE-Assessment")
!13 = !DISubroutineType(types: !14)
!14 = !{null}
!15 = !DILocalVariable(name: "data", scope: !11, file: !12, line: 39, type: !16)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !17, size: 64)
!17 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!18 = !DILocation(line: 39, column: 12, scope: !11)
!19 = !DILocalVariable(name: "dataBadBuffer", scope: !11, file: !12, line: 40, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 400, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 50)
!23 = !DILocation(line: 40, column: 10, scope: !11)
!24 = !DILocalVariable(name: "dataGoodBuffer", scope: !11, file: !12, line: 41, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !17, size: 800, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 100)
!28 = !DILocation(line: 41, column: 10, scope: !11)
!29 = !DILocation(line: 42, column: 5, scope: !11)
!30 = !DILocation(line: 43, column: 5, scope: !11)
!31 = !DILocation(line: 43, column: 25, scope: !11)
!32 = !DILocation(line: 44, column: 5, scope: !11)
!33 = !DILocation(line: 45, column: 5, scope: !11)
!34 = !DILocation(line: 45, column: 27, scope: !11)
!35 = !DILocation(line: 46, column: 8, scope: !36)
!36 = distinct !DILexicalBlock(scope: !11, file: !12, line: 46, column: 8)
!37 = !DILocation(line: 46, column: 8, scope: !11)
!38 = !DILocation(line: 49, column: 16, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !12, line: 47, column: 5)
!40 = !DILocation(line: 49, column: 14, scope: !39)
!41 = !DILocation(line: 50, column: 5, scope: !39)
!42 = !DILocalVariable(name: "dest", scope: !43, file: !12, line: 52, type: !25)
!43 = distinct !DILexicalBlock(scope: !11, file: !12, line: 51, column: 5)
!44 = !DILocation(line: 52, column: 14, scope: !43)
!45 = !DILocation(line: 53, column: 9, scope: !43)
!46 = !DILocation(line: 54, column: 9, scope: !43)
!47 = !DILocation(line: 54, column: 21, scope: !43)
!48 = !DILocation(line: 57, column: 9, scope: !43)
!49 = !DILocation(line: 57, column: 22, scope: !43)
!50 = !DILocation(line: 57, column: 35, scope: !43)
!51 = !DILocation(line: 57, column: 28, scope: !43)
!52 = !DILocation(line: 57, column: 40, scope: !43)
!53 = !DILocation(line: 58, column: 9, scope: !43)
!54 = !DILocation(line: 58, column: 21, scope: !43)
!55 = !DILocation(line: 59, column: 19, scope: !43)
!56 = !DILocation(line: 59, column: 9, scope: !43)
!57 = !DILocation(line: 61, column: 1, scope: !11)
!58 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__char_declare_memcpy_08_good", scope: !12, file: !12, line: 126, type: !13, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!59 = !DILocation(line: 128, column: 5, scope: !58)
!60 = !DILocation(line: 129, column: 5, scope: !58)
!61 = !DILocation(line: 130, column: 1, scope: !58)
!62 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 142, type: !63, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!63 = !DISubroutineType(types: !64)
!64 = !{!65, !65, !66}
!65 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!66 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !16, size: 64)
!67 = !DILocalVariable(name: "argc", arg: 1, scope: !62, file: !12, line: 142, type: !65)
!68 = !DILocation(line: 142, column: 14, scope: !62)
!69 = !DILocalVariable(name: "argv", arg: 2, scope: !62, file: !12, line: 142, type: !66)
!70 = !DILocation(line: 142, column: 27, scope: !62)
!71 = !DILocation(line: 145, column: 22, scope: !62)
!72 = !DILocation(line: 145, column: 12, scope: !62)
!73 = !DILocation(line: 145, column: 5, scope: !62)
!74 = !DILocation(line: 147, column: 5, scope: !62)
!75 = !DILocation(line: 148, column: 5, scope: !62)
!76 = !DILocation(line: 149, column: 5, scope: !62)
!77 = !DILocation(line: 152, column: 5, scope: !62)
!78 = !DILocation(line: 153, column: 5, scope: !62)
!79 = !DILocation(line: 154, column: 5, scope: !62)
!80 = !DILocation(line: 156, column: 5, scope: !62)
!81 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !12, file: !12, line: 25, type: !82, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!82 = !DISubroutineType(types: !83)
!83 = !{!65}
!84 = !DILocation(line: 27, column: 5, scope: !81)
!85 = distinct !DISubprogram(name: "goodG2B1", scope: !12, file: !12, line: 68, type: !13, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!86 = !DILocalVariable(name: "data", scope: !85, file: !12, line: 70, type: !16)
!87 = !DILocation(line: 70, column: 12, scope: !85)
!88 = !DILocalVariable(name: "dataBadBuffer", scope: !85, file: !12, line: 71, type: !20)
!89 = !DILocation(line: 71, column: 10, scope: !85)
!90 = !DILocalVariable(name: "dataGoodBuffer", scope: !85, file: !12, line: 72, type: !25)
!91 = !DILocation(line: 72, column: 10, scope: !85)
!92 = !DILocation(line: 73, column: 5, scope: !85)
!93 = !DILocation(line: 74, column: 5, scope: !85)
!94 = !DILocation(line: 74, column: 25, scope: !85)
!95 = !DILocation(line: 75, column: 5, scope: !85)
!96 = !DILocation(line: 76, column: 5, scope: !85)
!97 = !DILocation(line: 76, column: 27, scope: !85)
!98 = !DILocation(line: 77, column: 8, scope: !99)
!99 = distinct !DILexicalBlock(scope: !85, file: !12, line: 77, column: 8)
!100 = !DILocation(line: 77, column: 8, scope: !85)
!101 = !DILocation(line: 80, column: 9, scope: !102)
!102 = distinct !DILexicalBlock(scope: !99, file: !12, line: 78, column: 5)
!103 = !DILocation(line: 81, column: 5, scope: !102)
!104 = !DILocation(line: 85, column: 16, scope: !105)
!105 = distinct !DILexicalBlock(scope: !99, file: !12, line: 83, column: 5)
!106 = !DILocation(line: 85, column: 14, scope: !105)
!107 = !DILocalVariable(name: "dest", scope: !108, file: !12, line: 88, type: !25)
!108 = distinct !DILexicalBlock(scope: !85, file: !12, line: 87, column: 5)
!109 = !DILocation(line: 88, column: 14, scope: !108)
!110 = !DILocation(line: 89, column: 9, scope: !108)
!111 = !DILocation(line: 90, column: 9, scope: !108)
!112 = !DILocation(line: 90, column: 21, scope: !108)
!113 = !DILocation(line: 93, column: 9, scope: !108)
!114 = !DILocation(line: 93, column: 22, scope: !108)
!115 = !DILocation(line: 93, column: 35, scope: !108)
!116 = !DILocation(line: 93, column: 28, scope: !108)
!117 = !DILocation(line: 93, column: 40, scope: !108)
!118 = !DILocation(line: 94, column: 9, scope: !108)
!119 = !DILocation(line: 94, column: 21, scope: !108)
!120 = !DILocation(line: 95, column: 19, scope: !108)
!121 = !DILocation(line: 95, column: 9, scope: !108)
!122 = !DILocation(line: 97, column: 1, scope: !85)
!123 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !12, file: !12, line: 30, type: !82, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!124 = !DILocation(line: 32, column: 5, scope: !123)
!125 = distinct !DISubprogram(name: "goodG2B2", scope: !12, file: !12, line: 100, type: !13, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!126 = !DILocalVariable(name: "data", scope: !125, file: !12, line: 102, type: !16)
!127 = !DILocation(line: 102, column: 12, scope: !125)
!128 = !DILocalVariable(name: "dataBadBuffer", scope: !125, file: !12, line: 103, type: !20)
!129 = !DILocation(line: 103, column: 10, scope: !125)
!130 = !DILocalVariable(name: "dataGoodBuffer", scope: !125, file: !12, line: 104, type: !25)
!131 = !DILocation(line: 104, column: 10, scope: !125)
!132 = !DILocation(line: 105, column: 5, scope: !125)
!133 = !DILocation(line: 106, column: 5, scope: !125)
!134 = !DILocation(line: 106, column: 25, scope: !125)
!135 = !DILocation(line: 107, column: 5, scope: !125)
!136 = !DILocation(line: 108, column: 5, scope: !125)
!137 = !DILocation(line: 108, column: 27, scope: !125)
!138 = !DILocation(line: 109, column: 8, scope: !139)
!139 = distinct !DILexicalBlock(scope: !125, file: !12, line: 109, column: 8)
!140 = !DILocation(line: 109, column: 8, scope: !125)
!141 = !DILocation(line: 112, column: 16, scope: !142)
!142 = distinct !DILexicalBlock(scope: !139, file: !12, line: 110, column: 5)
!143 = !DILocation(line: 112, column: 14, scope: !142)
!144 = !DILocation(line: 113, column: 5, scope: !142)
!145 = !DILocalVariable(name: "dest", scope: !146, file: !12, line: 115, type: !25)
!146 = distinct !DILexicalBlock(scope: !125, file: !12, line: 114, column: 5)
!147 = !DILocation(line: 115, column: 14, scope: !146)
!148 = !DILocation(line: 116, column: 9, scope: !146)
!149 = !DILocation(line: 117, column: 9, scope: !146)
!150 = !DILocation(line: 117, column: 21, scope: !146)
!151 = !DILocation(line: 120, column: 9, scope: !146)
!152 = !DILocation(line: 120, column: 22, scope: !146)
!153 = !DILocation(line: 120, column: 35, scope: !146)
!154 = !DILocation(line: 120, column: 28, scope: !146)
!155 = !DILocation(line: 120, column: 40, scope: !146)
!156 = !DILocation(line: 121, column: 9, scope: !146)
!157 = !DILocation(line: 121, column: 21, scope: !146)
!158 = !DILocation(line: 122, column: 19, scope: !146)
!159 = !DILocation(line: 122, column: 9, scope: !146)
!160 = !DILocation(line: 124, column: 1, scope: !125)
