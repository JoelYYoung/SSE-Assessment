; ModuleID = './juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_08.c'
source_filename = "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_08.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"Calling good()...\00", align 1
@.str.1 = private unnamed_addr constant [16 x i8] c"Finished good()\00", align 1
@.str.2 = private unnamed_addr constant [17 x i8] c"Calling bad()...\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"Finished bad()\00", align 1
@.str.4 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_08_bad() #0 !dbg !15 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !21, metadata !DIExpression()), !dbg !22
  %0 = alloca i8, i64 200, align 16, !dbg !23
  %1 = bitcast i8* %0 to i32*, !dbg !24
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !22
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !25, metadata !DIExpression()), !dbg !26
  %2 = alloca i8, i64 400, align 16, !dbg !27
  %3 = bitcast i8* %2 to i32*, !dbg !28
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !26
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !29
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !30
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !31
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !31
  store i32 0, i32* %arrayidx, align 4, !dbg !32
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !33
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !34
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !35
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !35
  store i32 0, i32* %arrayidx2, align 4, !dbg !36
  %call3 = call i32 @staticReturnsTrue(), !dbg !37
  %tobool = icmp ne i32 %call3, 0, !dbg !37
  br i1 %tobool, label %if.then, label %if.end, !dbg !39

if.then:                                          ; preds = %entry
  %8 = load i32*, i32** %dataBadBuffer, align 8, !dbg !40
  store i32* %8, i32** %data, align 8, !dbg !42
  br label %if.end, !dbg !43

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !44, metadata !DIExpression()), !dbg !49
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !50
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !51
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !52
  store i32 0, i32* %arrayidx5, align 4, !dbg !53
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !54
  %9 = bitcast i32* %arraydecay6 to i8*, !dbg !54
  %10 = load i32*, i32** %data, align 8, !dbg !55
  %11 = bitcast i32* %10 to i8*, !dbg !54
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !56
  %call8 = call i64 @wcslen(i32* %arraydecay7) #7, !dbg !57
  %mul = mul i64 %call8, 4, !dbg !58
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %9, i8* align 4 %11, i64 %mul, i1 false), !dbg !54
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !59
  store i32 0, i32* %arrayidx9, align 4, !dbg !60
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !61
  call void @printWLine(i32* %arraydecay10), !dbg !62
  ret void, !dbg !63
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
define dso_local void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_08_good() #0 !dbg !64 {
entry:
  call void @goodG2B1(), !dbg !65
  call void @goodG2B2(), !dbg !66
  ret void, !dbg !67
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main(i32 %argc, i8** %argv) #0 !dbg !68 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %argc.addr, metadata !74, metadata !DIExpression()), !dbg !75
  store i8** %argv, i8*** %argv.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %argv.addr, metadata !76, metadata !DIExpression()), !dbg !77
  %call = call i64 @time(i64* null) #6, !dbg !78
  %conv = trunc i64 %call to i32, !dbg !79
  call void @srand(i32 %conv) #6, !dbg !80
  call void @printLine(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str, i64 0, i64 0)), !dbg !81
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_08_good(), !dbg !82
  call void @printLine(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i64 0, i64 0)), !dbg !83
  call void @printLine(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.2, i64 0, i64 0)), !dbg !84
  call void @CWE126_Buffer_Overread__wchar_t_alloca_memcpy_08_bad(), !dbg !85
  call void @printLine(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0)), !dbg !86
  ret i32 0, !dbg !87
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

; Function Attrs: nounwind
declare dso_local i64 @time(i64*) #2

declare dso_local void @printLine(i8*) #5

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsTrue() #0 !dbg !88 {
entry:
  ret i32 1, !dbg !91
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B1() #0 !dbg !92 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !93, metadata !DIExpression()), !dbg !94
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !95, metadata !DIExpression()), !dbg !96
  %0 = alloca i8, i64 200, align 16, !dbg !97
  %1 = bitcast i8* %0 to i32*, !dbg !98
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !96
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !99, metadata !DIExpression()), !dbg !100
  %2 = alloca i8, i64 400, align 16, !dbg !101
  %3 = bitcast i8* %2 to i32*, !dbg !102
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !100
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !103
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !104
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !105
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !105
  store i32 0, i32* %arrayidx, align 4, !dbg !106
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !107
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !108
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !109
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !109
  store i32 0, i32* %arrayidx2, align 4, !dbg !110
  %call3 = call i32 @staticReturnsFalse(), !dbg !111
  %tobool = icmp ne i32 %call3, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.else, !dbg !113

if.then:                                          ; preds = %entry
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.4, i64 0, i64 0)), !dbg !114
  br label %if.end, !dbg !116

if.else:                                          ; preds = %entry
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !117
  store i32* %8, i32** %data, align 8, !dbg !119
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !120, metadata !DIExpression()), !dbg !122
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !123
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !124
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !125
  store i32 0, i32* %arrayidx5, align 4, !dbg !126
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !127
  %9 = bitcast i32* %arraydecay6 to i8*, !dbg !127
  %10 = load i32*, i32** %data, align 8, !dbg !128
  %11 = bitcast i32* %10 to i8*, !dbg !127
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !129
  %call8 = call i64 @wcslen(i32* %arraydecay7) #7, !dbg !130
  %mul = mul i64 %call8, 4, !dbg !131
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %9, i8* align 4 %11, i64 %mul, i1 false), !dbg !127
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !132
  store i32 0, i32* %arrayidx9, align 4, !dbg !133
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !134
  call void @printWLine(i32* %arraydecay10), !dbg !135
  ret void, !dbg !136
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @staticReturnsFalse() #0 !dbg !137 {
entry:
  ret i32 0, !dbg !138
}

; Function Attrs: noinline nounwind uwtable
define internal void @goodG2B2() #0 !dbg !139 {
entry:
  %data = alloca i32*, align 8
  %dataBadBuffer = alloca i32*, align 8
  %dataGoodBuffer = alloca i32*, align 8
  %dest = alloca [100 x i32], align 16
  call void @llvm.dbg.declare(metadata i32** %data, metadata !140, metadata !DIExpression()), !dbg !141
  call void @llvm.dbg.declare(metadata i32** %dataBadBuffer, metadata !142, metadata !DIExpression()), !dbg !143
  %0 = alloca i8, i64 200, align 16, !dbg !144
  %1 = bitcast i8* %0 to i32*, !dbg !145
  store i32* %1, i32** %dataBadBuffer, align 8, !dbg !143
  call void @llvm.dbg.declare(metadata i32** %dataGoodBuffer, metadata !146, metadata !DIExpression()), !dbg !147
  %2 = alloca i8, i64 400, align 16, !dbg !148
  %3 = bitcast i8* %2 to i32*, !dbg !149
  store i32* %3, i32** %dataGoodBuffer, align 8, !dbg !147
  %4 = load i32*, i32** %dataBadBuffer, align 8, !dbg !150
  %call = call i32* @wmemset(i32* %4, i32 65, i64 49) #6, !dbg !151
  %5 = load i32*, i32** %dataBadBuffer, align 8, !dbg !152
  %arrayidx = getelementptr inbounds i32, i32* %5, i64 49, !dbg !152
  store i32 0, i32* %arrayidx, align 4, !dbg !153
  %6 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !154
  %call1 = call i32* @wmemset(i32* %6, i32 65, i64 99) #6, !dbg !155
  %7 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !156
  %arrayidx2 = getelementptr inbounds i32, i32* %7, i64 99, !dbg !156
  store i32 0, i32* %arrayidx2, align 4, !dbg !157
  %call3 = call i32 @staticReturnsTrue(), !dbg !158
  %tobool = icmp ne i32 %call3, 0, !dbg !158
  br i1 %tobool, label %if.then, label %if.end, !dbg !160

if.then:                                          ; preds = %entry
  %8 = load i32*, i32** %dataGoodBuffer, align 8, !dbg !161
  store i32* %8, i32** %data, align 8, !dbg !163
  br label %if.end, !dbg !164

if.end:                                           ; preds = %if.then, %entry
  call void @llvm.dbg.declare(metadata [100 x i32]* %dest, metadata !165, metadata !DIExpression()), !dbg !167
  %arraydecay = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !168
  %call4 = call i32* @wmemset(i32* %arraydecay, i32 67, i64 99) #6, !dbg !169
  %arrayidx5 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !170
  store i32 0, i32* %arrayidx5, align 4, !dbg !171
  %arraydecay6 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !172
  %9 = bitcast i32* %arraydecay6 to i8*, !dbg !172
  %10 = load i32*, i32** %data, align 8, !dbg !173
  %11 = bitcast i32* %10 to i8*, !dbg !172
  %arraydecay7 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !174
  %call8 = call i64 @wcslen(i32* %arraydecay7) #7, !dbg !175
  %mul = mul i64 %call8, 4, !dbg !176
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 16 %9, i8* align 4 %11, i64 %mul, i1 false), !dbg !172
  %arrayidx9 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 99, !dbg !177
  store i32 0, i32* %arrayidx9, align 4, !dbg !178
  %arraydecay10 = getelementptr inbounds [100 x i32], [100 x i32]* %dest, i64 0, i64 0, !dbg !179
  call void @printWLine(i32* %arraydecay10), !dbg !180
  ret void, !dbg !181
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readonly willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { argmemonly nofree nounwind willreturn }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_08.c", directory: "/root/SSE-Assessment")
!2 = !{}
!3 = !{!4, !8}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIDerivedType(tag: DW_TAG_typedef, name: "wchar_t", file: !6, line: 74, baseType: !7)
!6 = !DIFile(filename: "node_modules/llvm-13.0.0.obj/lib/clang/13.0.0/include/stddef.h", directory: "/root")
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!9 = !{i32 7, !"Dwarf Version", i32 4}
!10 = !{i32 2, !"Debug Info Version", i32 3}
!11 = !{i32 1, !"wchar_size", i32 4}
!12 = !{i32 7, !"uwtable", i32 1}
!13 = !{i32 7, !"frame-pointer", i32 2}
!14 = !{!"clang version 13.0.0"}
!15 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_08_bad", scope: !16, file: !16, line: 37, type: !17, scopeLine: 38, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!16 = !DIFile(filename: "./juliet_testcases/src/CWE126_Buffer_Overread__wchar_t_alloca_memcpy_08.c", directory: "/root/SSE-Assessment")
!17 = !DISubroutineType(types: !18)
!18 = !{null}
!19 = !DILocalVariable(name: "data", scope: !15, file: !16, line: 39, type: !4)
!20 = !DILocation(line: 39, column: 15, scope: !15)
!21 = !DILocalVariable(name: "dataBadBuffer", scope: !15, file: !16, line: 40, type: !4)
!22 = !DILocation(line: 40, column: 15, scope: !15)
!23 = !DILocation(line: 40, column: 42, scope: !15)
!24 = !DILocation(line: 40, column: 31, scope: !15)
!25 = !DILocalVariable(name: "dataGoodBuffer", scope: !15, file: !16, line: 41, type: !4)
!26 = !DILocation(line: 41, column: 15, scope: !15)
!27 = !DILocation(line: 41, column: 43, scope: !15)
!28 = !DILocation(line: 41, column: 32, scope: !15)
!29 = !DILocation(line: 42, column: 13, scope: !15)
!30 = !DILocation(line: 42, column: 5, scope: !15)
!31 = !DILocation(line: 43, column: 5, scope: !15)
!32 = !DILocation(line: 43, column: 25, scope: !15)
!33 = !DILocation(line: 44, column: 13, scope: !15)
!34 = !DILocation(line: 44, column: 5, scope: !15)
!35 = !DILocation(line: 45, column: 5, scope: !15)
!36 = !DILocation(line: 45, column: 27, scope: !15)
!37 = !DILocation(line: 46, column: 8, scope: !38)
!38 = distinct !DILexicalBlock(scope: !15, file: !16, line: 46, column: 8)
!39 = !DILocation(line: 46, column: 8, scope: !15)
!40 = !DILocation(line: 49, column: 16, scope: !41)
!41 = distinct !DILexicalBlock(scope: !38, file: !16, line: 47, column: 5)
!42 = !DILocation(line: 49, column: 14, scope: !41)
!43 = !DILocation(line: 50, column: 5, scope: !41)
!44 = !DILocalVariable(name: "dest", scope: !45, file: !16, line: 52, type: !46)
!45 = distinct !DILexicalBlock(scope: !15, file: !16, line: 51, column: 5)
!46 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 3200, elements: !47)
!47 = !{!48}
!48 = !DISubrange(count: 100)
!49 = !DILocation(line: 52, column: 17, scope: !45)
!50 = !DILocation(line: 53, column: 17, scope: !45)
!51 = !DILocation(line: 53, column: 9, scope: !45)
!52 = !DILocation(line: 54, column: 9, scope: !45)
!53 = !DILocation(line: 54, column: 21, scope: !45)
!54 = !DILocation(line: 57, column: 9, scope: !45)
!55 = !DILocation(line: 57, column: 22, scope: !45)
!56 = !DILocation(line: 57, column: 35, scope: !45)
!57 = !DILocation(line: 57, column: 28, scope: !45)
!58 = !DILocation(line: 57, column: 40, scope: !45)
!59 = !DILocation(line: 58, column: 9, scope: !45)
!60 = !DILocation(line: 58, column: 21, scope: !45)
!61 = !DILocation(line: 59, column: 20, scope: !45)
!62 = !DILocation(line: 59, column: 9, scope: !45)
!63 = !DILocation(line: 61, column: 1, scope: !15)
!64 = distinct !DISubprogram(name: "CWE126_Buffer_Overread__wchar_t_alloca_memcpy_08_good", scope: !16, file: !16, line: 126, type: !17, scopeLine: 127, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!65 = !DILocation(line: 128, column: 5, scope: !64)
!66 = !DILocation(line: 129, column: 5, scope: !64)
!67 = !DILocation(line: 130, column: 1, scope: !64)
!68 = distinct !DISubprogram(name: "main", scope: !16, file: !16, line: 142, type: !69, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!69 = !DISubroutineType(types: !70)
!70 = !{!7, !7, !71}
!71 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !72, size: 64)
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !73, size: 64)
!73 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!74 = !DILocalVariable(name: "argc", arg: 1, scope: !68, file: !16, line: 142, type: !7)
!75 = !DILocation(line: 142, column: 14, scope: !68)
!76 = !DILocalVariable(name: "argv", arg: 2, scope: !68, file: !16, line: 142, type: !71)
!77 = !DILocation(line: 142, column: 27, scope: !68)
!78 = !DILocation(line: 145, column: 22, scope: !68)
!79 = !DILocation(line: 145, column: 12, scope: !68)
!80 = !DILocation(line: 145, column: 5, scope: !68)
!81 = !DILocation(line: 147, column: 5, scope: !68)
!82 = !DILocation(line: 148, column: 5, scope: !68)
!83 = !DILocation(line: 149, column: 5, scope: !68)
!84 = !DILocation(line: 152, column: 5, scope: !68)
!85 = !DILocation(line: 153, column: 5, scope: !68)
!86 = !DILocation(line: 154, column: 5, scope: !68)
!87 = !DILocation(line: 156, column: 5, scope: !68)
!88 = distinct !DISubprogram(name: "staticReturnsTrue", scope: !16, file: !16, line: 25, type: !89, scopeLine: 26, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!89 = !DISubroutineType(types: !90)
!90 = !{!7}
!91 = !DILocation(line: 27, column: 5, scope: !88)
!92 = distinct !DISubprogram(name: "goodG2B1", scope: !16, file: !16, line: 68, type: !17, scopeLine: 69, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!93 = !DILocalVariable(name: "data", scope: !92, file: !16, line: 70, type: !4)
!94 = !DILocation(line: 70, column: 15, scope: !92)
!95 = !DILocalVariable(name: "dataBadBuffer", scope: !92, file: !16, line: 71, type: !4)
!96 = !DILocation(line: 71, column: 15, scope: !92)
!97 = !DILocation(line: 71, column: 42, scope: !92)
!98 = !DILocation(line: 71, column: 31, scope: !92)
!99 = !DILocalVariable(name: "dataGoodBuffer", scope: !92, file: !16, line: 72, type: !4)
!100 = !DILocation(line: 72, column: 15, scope: !92)
!101 = !DILocation(line: 72, column: 43, scope: !92)
!102 = !DILocation(line: 72, column: 32, scope: !92)
!103 = !DILocation(line: 73, column: 13, scope: !92)
!104 = !DILocation(line: 73, column: 5, scope: !92)
!105 = !DILocation(line: 74, column: 5, scope: !92)
!106 = !DILocation(line: 74, column: 25, scope: !92)
!107 = !DILocation(line: 75, column: 13, scope: !92)
!108 = !DILocation(line: 75, column: 5, scope: !92)
!109 = !DILocation(line: 76, column: 5, scope: !92)
!110 = !DILocation(line: 76, column: 27, scope: !92)
!111 = !DILocation(line: 77, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !92, file: !16, line: 77, column: 8)
!113 = !DILocation(line: 77, column: 8, scope: !92)
!114 = !DILocation(line: 80, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !16, line: 78, column: 5)
!116 = !DILocation(line: 81, column: 5, scope: !115)
!117 = !DILocation(line: 85, column: 16, scope: !118)
!118 = distinct !DILexicalBlock(scope: !112, file: !16, line: 83, column: 5)
!119 = !DILocation(line: 85, column: 14, scope: !118)
!120 = !DILocalVariable(name: "dest", scope: !121, file: !16, line: 88, type: !46)
!121 = distinct !DILexicalBlock(scope: !92, file: !16, line: 87, column: 5)
!122 = !DILocation(line: 88, column: 17, scope: !121)
!123 = !DILocation(line: 89, column: 17, scope: !121)
!124 = !DILocation(line: 89, column: 9, scope: !121)
!125 = !DILocation(line: 90, column: 9, scope: !121)
!126 = !DILocation(line: 90, column: 21, scope: !121)
!127 = !DILocation(line: 93, column: 9, scope: !121)
!128 = !DILocation(line: 93, column: 22, scope: !121)
!129 = !DILocation(line: 93, column: 35, scope: !121)
!130 = !DILocation(line: 93, column: 28, scope: !121)
!131 = !DILocation(line: 93, column: 40, scope: !121)
!132 = !DILocation(line: 94, column: 9, scope: !121)
!133 = !DILocation(line: 94, column: 21, scope: !121)
!134 = !DILocation(line: 95, column: 20, scope: !121)
!135 = !DILocation(line: 95, column: 9, scope: !121)
!136 = !DILocation(line: 97, column: 1, scope: !92)
!137 = distinct !DISubprogram(name: "staticReturnsFalse", scope: !16, file: !16, line: 30, type: !89, scopeLine: 31, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!138 = !DILocation(line: 32, column: 5, scope: !137)
!139 = distinct !DISubprogram(name: "goodG2B2", scope: !16, file: !16, line: 100, type: !17, scopeLine: 101, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !0, retainedNodes: !2)
!140 = !DILocalVariable(name: "data", scope: !139, file: !16, line: 102, type: !4)
!141 = !DILocation(line: 102, column: 15, scope: !139)
!142 = !DILocalVariable(name: "dataBadBuffer", scope: !139, file: !16, line: 103, type: !4)
!143 = !DILocation(line: 103, column: 15, scope: !139)
!144 = !DILocation(line: 103, column: 42, scope: !139)
!145 = !DILocation(line: 103, column: 31, scope: !139)
!146 = !DILocalVariable(name: "dataGoodBuffer", scope: !139, file: !16, line: 104, type: !4)
!147 = !DILocation(line: 104, column: 15, scope: !139)
!148 = !DILocation(line: 104, column: 43, scope: !139)
!149 = !DILocation(line: 104, column: 32, scope: !139)
!150 = !DILocation(line: 105, column: 13, scope: !139)
!151 = !DILocation(line: 105, column: 5, scope: !139)
!152 = !DILocation(line: 106, column: 5, scope: !139)
!153 = !DILocation(line: 106, column: 25, scope: !139)
!154 = !DILocation(line: 107, column: 13, scope: !139)
!155 = !DILocation(line: 107, column: 5, scope: !139)
!156 = !DILocation(line: 108, column: 5, scope: !139)
!157 = !DILocation(line: 108, column: 27, scope: !139)
!158 = !DILocation(line: 109, column: 8, scope: !159)
!159 = distinct !DILexicalBlock(scope: !139, file: !16, line: 109, column: 8)
!160 = !DILocation(line: 109, column: 8, scope: !139)
!161 = !DILocation(line: 112, column: 16, scope: !162)
!162 = distinct !DILexicalBlock(scope: !159, file: !16, line: 110, column: 5)
!163 = !DILocation(line: 112, column: 14, scope: !162)
!164 = !DILocation(line: 113, column: 5, scope: !162)
!165 = !DILocalVariable(name: "dest", scope: !166, file: !16, line: 115, type: !46)
!166 = distinct !DILexicalBlock(scope: !139, file: !16, line: 114, column: 5)
!167 = !DILocation(line: 115, column: 17, scope: !166)
!168 = !DILocation(line: 116, column: 17, scope: !166)
!169 = !DILocation(line: 116, column: 9, scope: !166)
!170 = !DILocation(line: 117, column: 9, scope: !166)
!171 = !DILocation(line: 117, column: 21, scope: !166)
!172 = !DILocation(line: 120, column: 9, scope: !166)
!173 = !DILocation(line: 120, column: 22, scope: !166)
!174 = !DILocation(line: 120, column: 35, scope: !166)
!175 = !DILocation(line: 120, column: 28, scope: !166)
!176 = !DILocation(line: 120, column: 40, scope: !166)
!177 = !DILocation(line: 121, column: 9, scope: !166)
!178 = !DILocation(line: 121, column: 21, scope: !166)
!179 = !DILocation(line: 122, column: 20, scope: !166)
!180 = !DILocation(line: 122, column: 9, scope: !166)
!181 = !DILocation(line: 124, column: 1, scope: !139)
