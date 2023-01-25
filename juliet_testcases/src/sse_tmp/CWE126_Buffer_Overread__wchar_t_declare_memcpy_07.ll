; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memcpy_07.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memcpy_07.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@staticFive = internal global i32 5, align 4, !dbg !0
@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_07_bad() #0 !dbg !16 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !23
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !24, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !29, metadata !DIExpression()), !dbg !33
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !34
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !35
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !36
  store i32 0, i32* %arrayidx, align 4, !dbg !37
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !38
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !39
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !40
  store i32 0, i32* %arrayidx3, align 4, !dbg !41
  %0 = load i32, i32* @staticFive, align 4, !dbg !42
  %cmp = icmp eq i32 %0, 5, !dbg !44
  br i1 %cmp, label %if.then, label %if.end, !dbg !45

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !46
  store i32* %arraydecay4, i32** %data, align 8, !dbg !48
  br label %if.end, !dbg !49

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !50, metadata !DIExpression()), !dbg !52
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !53
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !54
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !55
  store i32 0, i32* %arrayidx7, align 4, !dbg !56
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !57
  %1 = bitcast i32* %arraydecay8 to i8*, !dbg !57
  %2 = load i32*, i32** %data, align 8, !dbg !58
  %3 = bitcast i32* %2 to i8*, !dbg !57
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !59
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !60
  %mul = mul i64 %call10, 4, !dbg !61
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !57
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !62
  store i32 0, i32* %arrayidx11, align 4, !dbg !63
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !64
  call void @printWLine(i32* %arraydecay12), !dbg !65
  ret void, !dbg !66
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local i32* @wmemset(i32*, i32, i64) #2

; Function Attrs: nounwind readonly willreturn
declare dso_local i64 @wcslen(i32*) #3

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #4

declare dso_local void @printWLine(i32*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_07_good() #0 !dbg !67 {
entry:
  call void @goodG2B1(), !dbg !68
  call void @goodG2B2(), !dbg !69
  ret void, !dbg !70
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !71 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !77, metadata !DIExpression()), !dbg !78
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !79, metadata !DIExpression()), !dbg !80
  %call = call i64 @time(i64* null) #6, !dbg !81
  %conv = trunc i64 %call to i32, !dbg !82
  call void @srand(i32 %conv) #6, !dbg !83
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_07_good(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !86
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !87
  call void @CWE126_Buffer_Overread__wchar_t_declare_memcpy_07_bad(), !dbg !88
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !89
  ret i32 0, !dbg !90
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !91 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !92, metadata !DIExpression()), !dbg !93
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !96, metadata !DIExpression()), !dbg !97
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !98
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !99
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !100
  store i32 0, i32* %arrayidx, align 4, !dbg !101
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !102
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !103
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !104
  store i32 0, i32* %arrayidx3, align 4, !dbg !105
  %0 = load i32, i32* @staticFive, align 4, !dbg !106
  %cmp = icmp ne i32 %0, 5, !dbg !108
  br i1 %cmp, label %if.then, label %if.else, !dbg !109

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !110
  br label %if.end, !dbg !112

if.else:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !113
  store i32* %arraydecay4, i32** %data, align 8, !dbg !115
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !116, metadata !DIExpression()), !dbg !118
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !119
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !120
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !121
  store i32 0, i32* %arrayidx7, align 4, !dbg !122
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !123
  %1 = bitcast i32* %arraydecay8 to i8*, !dbg !123
  %2 = load i32*, i32** %data, align 8, !dbg !124
  %3 = bitcast i32* %2 to i8*, !dbg !123
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !125
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !126
  %mul = mul i64 %call10, 4, !dbg !127
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !123
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !128
  store i32 0, i32* %arrayidx11, align 4, !dbg !129
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !130
  call void @printWLine(i32* %arraydecay12), !dbg !131
  ret void, !dbg !132
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !133 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca [50 x i32], align 16
  %dataGoodBuffer = alloca [100 x i32], align 16
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !134, metadata !DIExpression()), !dbg !135
  call void @llvm.dbg.declare(metadata [50 x i32]* %dataBadBuffer, metadata !136, metadata !DIExpression()), !dbg !137
  call void @llvm.dbg.declare(metadata [100 x i32]* %dataGoodBuffer, metadata !138, metadata !DIExpression()), !dbg !139
  %arraydecay = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 0, !dbg !140
  %call = call i32* @wmemset(i32* %arraydecay, i32 65, i64 49) #6, !dbg !141
  %arrayidx = getelementptr inbounds [50 x i32], [50 x i32]* %dataBadBuffer, i64 0, i64 49, !dbg !142
  store i32 0, i32* %arrayidx, align 4, !dbg !143
  %arraydecay1 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !144
  %call2 = call i32* @wmemset(i32* %arraydecay1, i32 65, i64 99) #6, !dbg !145
  %arrayidx3 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 99, !dbg !146
  store i32 0, i32* %arrayidx3, align 4, !dbg !147
  %0 = load i32, i32* @staticFive, align 4, !dbg !148
  %cmp = icmp eq i32 %0, 5, !dbg !150
  br i1 %cmp, label %if.then, label %if.end, !dbg !151

if.then:                                          ; preds = %entry
  %arraydecay4 = getelementptr inbounds [100 x i32], [100 x i32]* %dataGoodBuffer, i64 0, i64 0, !dbg !152
  store i32* %arraydecay4, i32** %data, align 8, !dbg !154
  br label %if.end, !dbg !155

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !156, metadata !DIExpression()), !dbg !158
  %arraydecay5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !159
  %call6 = call i32* @wmemset(i32* %arraydecay5, i32 67, i64 99) #6, !dbg !160
  %arrayidx7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !161
  store i32 0, i32* %arrayidx7, align 4, !dbg !162
  %arraydecay8 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !163
  %1 = bitcast i32* %arraydecay8 to i8*, !dbg !163
  %2 = load i32*, i32** %data, align 8, !dbg !164
  %3 = bitcast i32* %2 to i8*, !dbg !163
  %arraydecay9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !165
  %call10 = call i64 @wcslen(i32* %arraydecay9) #7, !dbg !166
  %mul = mul i64 %call10, 4, !dbg !167
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %1, i8* align 4 %3, i64 %mul, i1 false), !dbg !163
  %arrayidx11 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !168
  store i32 0, i32* %arrayidx11, align 4, !dbg !169
  %arraydecay12 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !170
  call void @printWLine(i32* %arraydecay12), !dbg !171
  ret void, !dbg !172
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!10, !11, !12, !13, !14}
!llvm.ident = !{!15}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "staticFive", scope: !2, file: !8, line: 25, type: !9, isLocal: true, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !5, globals: !7, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!4 = !{}
!5 = !{!6}
!6 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!7 = !{!0}
!8 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_declare_memcpy_07.c", directory: "/home/joelyang/SSE-Assessment")
!9 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!10 = !{i32 7, !"Dwarf Version", i32 4}
!11 = !{i32 2, !"Debug Info Version", i32 3}
!12 = !{i32 1, !"wchar_size", i32 4}
!13 = !{i32 7, !"uwtable", i32 1}
!14 = !{i32 7, !"frame-pointer", i32 2}
!15 = !{!"clang version 13.0.0"}
!16 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_07_bad", scope: !8, file: !8, line: 29, type: !17, scopeLine: 30, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !16, file: !8, line: 31, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !22, line: 74, baseType: !9)
!22 = !DIFile(filename: "SVF/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/home/joelyang")
!23 = !DILocation(line: 31, column: 15, scope: !16)
!24 = !DILocalVariable(name: "dataBadBuffer", scope: !16, file: !8, line: 32, type: !25)
!25 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 1600, elements: !26)
!26 = !{!27}
!27 = !DISubrange(count: 50)
!28 = !DILocation(line: 32, column: 13, scope: !16)
!29 = !DILocalVariable(name: "dataGoodBuffer", scope: !16, file: !8, line: 33, type: !30)
!30 = !DICompositeType(tag: DW_TAG_array_type, baseType: !21, size: 3200, elements: !31)
!31 = !{!32}
!32 = !DISubrange(count: 100)
!33 = !DILocation(line: 33, column: 13, scope: !16)
!34 = !DILocation(line: 34, column: 13, scope: !16)
!35 = !DILocation(line: 34, column: 5, scope: !16)
!36 = !DILocation(line: 35, column: 5, scope: !16)
!37 = !DILocation(line: 35, column: 25, scope: !16)
!38 = !DILocation(line: 36, column: 13, scope: !16)
!39 = !DILocation(line: 36, column: 5, scope: !16)
!40 = !DILocation(line: 37, column: 5, scope: !16)
!41 = !DILocation(line: 37, column: 27, scope: !16)
!42 = !DILocation(line: 38, column: 8, scope: !43)
!43 = distinct !DILexicalBlock(scope: !16, file: !8, line: 38, column: 8)
!44 = !DILocation(line: 38, column: 18, scope: !43)
!45 = !DILocation(line: 38, column: 8, scope: !16)
!46 = !DILocation(line: 41, column: 16, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !8, line: 39, column: 5)
!48 = !DILocation(line: 41, column: 14, scope: !47)
!49 = !DILocation(line: 42, column: 5, scope: !47)
!50 = !DILocalVariable(name: "dest", scope: !51, file: !8, line: 44, type: !30)
!51 = distinct !DILexicalBlock(scope: !16, file: !8, line: 43, column: 5)
!52 = !DILocation(line: 44, column: 17, scope: !51)
!53 = !DILocation(line: 45, column: 17, scope: !51)
!54 = !DILocation(line: 45, column: 9, scope: !51)
!55 = !DILocation(line: 46, column: 9, scope: !51)
!56 = !DILocation(line: 46, column: 21, scope: !51)
!57 = !DILocation(line: 49, column: 9, scope: !51)
!58 = !DILocation(line: 49, column: 22, scope: !51)
!59 = !DILocation(line: 49, column: 35, scope: !51)
!60 = !DILocation(line: 49, column: 28, scope: !51)
!61 = !DILocation(line: 49, column: 40, scope: !51)
!62 = !DILocation(line: 50, column: 9, scope: !51)
!63 = !DILocation(line: 50, column: 21, scope: !51)
!64 = !DILocation(line: 51, column: 20, scope: !51)
!65 = !DILocation(line: 51, column: 9, scope: !51)
!66 = !DILocation(line: 53, column: 1, scope: !16)
!67 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_declare_memcpy_07_good", scope: !8, file: !8, line: 118, type: !17, scopeLine: 119, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!68 = !DILocation(line: 120, column: 5, scope: !67)
!69 = !DILocation(line: 121, column: 5, scope: !67)
!70 = !DILocation(line: 122, column: 1, scope: !67)
!71 = distinct !DISubprogram(name: "main", scope: !8, file: !8, line: 134, type: !72, scopeLine: 135, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!72 = !DISubroutineType(types: !73)
!73 = !{!9, !9, !74}
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!76 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!77 = !DILocalVariable(name: "argc", arg: 1, scope: !71, file: !8, line: 134, type: !9)
!78 = !DILocation(line: 134, column: 14, scope: !71)
!79 = !DILocalVariable(name: "argv", arg: 2, scope: !71, file: !8, line: 134, type: !74)
!80 = !DILocation(line: 134, column: 27, scope: !71)
!81 = !DILocation(line: 137, column: 22, scope: !71)
!82 = !DILocation(line: 137, column: 12, scope: !71)
!83 = !DILocation(line: 137, column: 5, scope: !71)
!84 = !DILocation(line: 139, column: 5, scope: !71)
!85 = !DILocation(line: 140, column: 5, scope: !71)
!86 = !DILocation(line: 141, column: 5, scope: !71)
!87 = !DILocation(line: 144, column: 5, scope: !71)
!88 = !DILocation(line: 145, column: 5, scope: !71)
!89 = !DILocation(line: 146, column: 5, scope: !71)
!90 = !DILocation(line: 148, column: 5, scope: !71)
!91 = distinct !DISubprogram(name: "goodG2B1", scope: !8, file: !8, line: 60, type: !17, scopeLine: 61, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!92 = !DILocalVariable(name: "data", scope: !91, file: !8, line: 62, type: !20)
!93 = !DILocation(line: 62, column: 15, scope: !91)
!94 = !DILocalVariable(name: "dataBadBuffer", scope: !91, file: !8, line: 63, type: !25)
!95 = !DILocation(line: 63, column: 13, scope: !91)
!96 = !DILocalVariable(name: "dataGoodBuffer", scope: !91, file: !8, line: 64, type: !30)
!97 = !DILocation(line: 64, column: 13, scope: !91)
!98 = !DILocation(line: 65, column: 13, scope: !91)
!99 = !DILocation(line: 65, column: 5, scope: !91)
!100 = !DILocation(line: 66, column: 5, scope: !91)
!101 = !DILocation(line: 66, column: 25, scope: !91)
!102 = !DILocation(line: 67, column: 13, scope: !91)
!103 = !DILocation(line: 67, column: 5, scope: !91)
!104 = !DILocation(line: 68, column: 5, scope: !91)
!105 = !DILocation(line: 68, column: 27, scope: !91)
!106 = !DILocation(line: 69, column: 8, scope: !107)
!107 = distinct !DILexicalBlock(scope: !91, file: !8, line: 69, column: 8)
!108 = !DILocation(line: 69, column: 18, scope: !107)
!109 = !DILocation(line: 69, column: 8, scope: !91)
!110 = !DILocation(line: 72, column: 9, scope: !111)
!111 = distinct !DILexicalBlock(scope: !107, file: !8, line: 70, column: 5)
!112 = !DILocation(line: 73, column: 5, scope: !111)
!113 = !DILocation(line: 77, column: 16, scope: !114)
!114 = distinct !DILexicalBlock(scope: !107, file: !8, line: 75, column: 5)
!115 = !DILocation(line: 77, column: 14, scope: !114)
!116 = !DILocalVariable(name: "dest", scope: !117, file: !8, line: 80, type: !30)
!117 = distinct !DILexicalBlock(scope: !91, file: !8, line: 79, column: 5)
!118 = !DILocation(line: 80, column: 17, scope: !117)
!119 = !DILocation(line: 81, column: 17, scope: !117)
!120 = !DILocation(line: 81, column: 9, scope: !117)
!121 = !DILocation(line: 82, column: 9, scope: !117)
!122 = !DILocation(line: 82, column: 21, scope: !117)
!123 = !DILocation(line: 85, column: 9, scope: !117)
!124 = !DILocation(line: 85, column: 22, scope: !117)
!125 = !DILocation(line: 85, column: 35, scope: !117)
!126 = !DILocation(line: 85, column: 28, scope: !117)
!127 = !DILocation(line: 85, column: 40, scope: !117)
!128 = !DILocation(line: 86, column: 9, scope: !117)
!129 = !DILocation(line: 86, column: 21, scope: !117)
!130 = !DILocation(line: 87, column: 20, scope: !117)
!131 = !DILocation(line: 87, column: 9, scope: !117)
!132 = !DILocation(line: 89, column: 1, scope: !91)
!133 = distinct !DISubprogram(name: "goodG2B2", scope: !8, file: !8, line: 92, type: !17, scopeLine: 93, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !2, retainedNodes: !4)
!134 = !DILocalVariable(name: "data", scope: !133, file: !8, line: 94, type: !20)
!135 = !DILocation(line: 94, column: 15, scope: !133)
!136 = !DILocalVariable(name: "dataBadBuffer", scope: !133, file: !8, line: 95, type: !25)
!137 = !DILocation(line: 95, column: 13, scope: !133)
!138 = !DILocalVariable(name: "dataGoodBuffer", scope: !133, file: !8, line: 96, type: !30)
!139 = !DILocation(line: 96, column: 13, scope: !133)
!140 = !DILocation(line: 97, column: 13, scope: !133)
!141 = !DILocation(line: 97, column: 5, scope: !133)
!142 = !DILocation(line: 98, column: 5, scope: !133)
!143 = !DILocation(line: 98, column: 25, scope: !133)
!144 = !DILocation(line: 99, column: 13, scope: !133)
!145 = !DILocation(line: 99, column: 5, scope: !133)
!146 = !DILocation(line: 100, column: 5, scope: !133)
!147 = !DILocation(line: 100, column: 27, scope: !133)
!148 = !DILocation(line: 101, column: 8, scope: !149)
!149 = distinct !DILexicalBlock(scope: !133, file: !8, line: 101, column: 8)
!150 = !DILocation(line: 101, column: 18, scope: !149)
!151 = !DILocation(line: 101, column: 8, scope: !133)
!152 = !DILocation(line: 104, column: 16, scope: !153)
!153 = distinct !DILexicalBlock(scope: !149, file: !8, line: 102, column: 5)
!154 = !DILocation(line: 104, column: 14, scope: !153)
!155 = !DILocation(line: 105, column: 5, scope: !153)
!156 = !DILocalVariable(name: "dest", scope: !157, file: !8, line: 107, type: !30)
!157 = distinct !DILexicalBlock(scope: !133, file: !8, line: 106, column: 5)
!158 = !DILocation(line: 107, column: 17, scope: !157)
!159 = !DILocation(line: 108, column: 17, scope: !157)
!160 = !DILocation(line: 108, column: 9, scope: !157)
!161 = !DILocation(line: 109, column: 9, scope: !157)
!162 = !DILocation(line: 109, column: 21, scope: !157)
!163 = !DILocation(line: 112, column: 9, scope: !157)
!164 = !DILocation(line: 112, column: 22, scope: !157)
!165 = !DILocation(line: 112, column: 35, scope: !157)
!166 = !DILocation(line: 112, column: 28, scope: !157)
!167 = !DILocation(line: 112, column: 40, scope: !157)
!168 = !DILocation(line: 113, column: 9, scope: !157)
!169 = !DILocation(line: 113, column: 21, scope: !157)
!170 = !DILocation(line: 114, column: 20, scope: !157)
!171 = !DILocation(line: 114, column: 9, scope: !157)
!172 = !DILocation(line: 116, column: 1, scope: !133)
